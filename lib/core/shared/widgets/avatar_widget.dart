import 'package:chat_app/core/shared/entities/user_entity.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class AvatarWidget extends StatelessWidget {
  final double size;

  final UserEntity user;

  final VoidCallback? onTap;

  final bool showBorder;

  final Color borderColor;

  final double borderWidth;

  final bool useHeroAnimation;

  final String? heroTag;
  const AvatarWidget({
    super.key,
    required this.size,
    required this.user,
    this.onTap,
    this.showBorder = false,
    this.borderColor = Colors.white,
    this.borderWidth = 2.0,
    this.useHeroAnimation = false,
    this.heroTag,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: _buildAvatarContent(),
    );
  }

  Widget _buildAvatarContent() {
    if (!useHeroAnimation) {
      return _buildAvatarWithBorder(user.profilePicture);
    }

    return Hero(
      tag: heroTag ?? '${user.firstName}_${user.lastName}_avatar',
      child: _buildAvatarWithBorder(user.profilePicture),
    );
  }

  Widget _buildAvatarWithBorder(String? avatarUrl) {
    return Container(
      width: size * 2,
      height: size * 2,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: showBorder
            ? Border.all(color: borderColor, width: borderWidth)
            : null,
      ),
      child: Stack(
        children: [
          ClipOval(
            child: _buildNetworkAvatarOrFallback(avatarUrl),
          ),
          if (_checkIsonline(user)) _buildOnlineIndicator(),
        ],
      ),
    );
  }

  _checkIsonline(final UserEntity user) {
    final now = DateTime.now();
    final diff = now.difference(user.lastOnline);
    return diff.inSeconds < 60;
  }

  Widget _buildNetworkAvatarOrFallback(String? avatarUrl) {
    if (avatarUrl == null || avatarUrl.isEmpty) {
      return _buildFallback();
    }

    return Image.network(
      avatarUrl,
      width: size * 2,
      height: size * 2,
      fit: BoxFit.cover,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return Shimmer.fromColors(
          baseColor: Colors.black12,
          highlightColor: Colors.black26,
          child: Container(
            color: Colors.white,
            width: double.infinity,
            height: double.infinity,
          ),
        );
      },
      errorBuilder: (context, error, stackTrace) {
        return _buildFallback();
      },
    );
  }

  Widget _buildFallback() {
    final initials = _extractInitials();
    return Container(
      color: Colors.grey.shade200,
      alignment: Alignment.center,
      child: Text(
        initials,
        style: TextStyle(
          fontSize: size-5,
          fontWeight: FontWeight.w600,
          color: Colors.black54,
        ),
      ),
    );
  }

  String _extractInitials() {
    final first = (user.firstName??'A').isNotEmpty ? (user.firstName??'A')[0] : '';
    final last = (user.lastName??'A').isNotEmpty ? (user.lastName??'A')[0] : '';
    return (first + last).toUpperCase();
  }

  Widget _buildOnlineIndicator() {
    return Positioned(
      right: -2,
      bottom:-2,
      child: Container(
        width: size*0.6,
        height: size*0.6,
        decoration: BoxDecoration(
          color: Colors.green,
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.white,
            width: 2,
          ),
        ),
      ),
    );
  }
}

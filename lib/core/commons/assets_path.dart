class AssetsPath {
  static String _baseSvgPath(String fileName) => 'assets/svgs/$fileName.svg';

  static String emailIcon = _baseSvgPath('email_icon');
  static String userIcon = _baseSvgPath('user_icon');
}

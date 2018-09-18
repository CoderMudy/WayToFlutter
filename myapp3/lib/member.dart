class Member {
  final String login;
  final String avatarUrl;

  Member(this.login,this.avatarUrl) {//构造函数
    if(login == null){
      throw new ArgumentError("login error Member canot be null");
    }

    if(avatarUrl == null){
      throw new ArgumentError("login error Member canot be null");
    }
  }
}
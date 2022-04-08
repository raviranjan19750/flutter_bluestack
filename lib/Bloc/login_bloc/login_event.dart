abstract class LoginEvent{}

class UsernameChanged extends LoginEvent{

    final String username;

    UsernameChanged({this.username});

}

class PasswordChanged extends LoginEvent{

    final String password;

    PasswordChanged({this.password});


}

class PasswordVisibilityChanged extends LoginEvent{}

class LoginSubmitted extends LoginEvent{}
abstract class AuthenticationException implements Exception {}

class AuthenticationFirebaseException extends AuthenticationException {
  final String code;

  AuthenticationFirebaseException({required this.code});

  String message() {
    switch (code) {
      case 'email-already-exists':
        return 'Foi feita uma tentativa de criar um novo usuário com um e-mail existente!';
      case 'wrong-password':
        return 'Sua senha está errada!';
      case 'invalid-email':
        return 'Seu endereço de e-mail parece estar incorreto!';
      case 'user-not-found':
        return 'Este e-mail não existe!';
      case 'user-disabled':
        return 'Este e-mail foi desativado!';
      case 'too-many-requests':
        return 'Mitos pedidos. Tente mais tarde.!';
      case 'operation-not-allowed':
        return 'O login com e-mail e senha não está habilitado!';
      case 'invalid-argument':
        return 'Um argumento inválido foi fornecido!';
      case 'undefined':
      default:
        return 'Um erro inesperado!';
    }
  }

  @override
  String toString() {
    return message();
  }
}

class AuthenticationGenericException extends AuthenticationException {
  String message;

  AuthenticationGenericException({required this.message});

  @override
  String toString() {
    return message;
  }
}

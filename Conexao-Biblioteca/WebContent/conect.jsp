<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%@ page import="java.sql.*"  %>
<% 
Connection conexao = null;
String url = "jdbc:mysql://localhost:3306/empresa";
String usuario = "root";
String senha = "";
	
try {
	Class.forName("org.gjt.mm.mysql.Driver");
	conexao = DriverManager.getConnection(url, usuario, senha);
	out.println("Conexão efetuada com sucesso!!!");
	
	
} 

catch(ClassNotFoundException cnfe) {
	out.println("Erro ao carregar o drive");
	cnfe.printStackTrace();
}

Connection con = conexao;
PreparedStatement pst = null;
String nome = request.getParameter("nome");
int codigo = Integer.parseInt(request.getParameter("codigo"));
int idade = Integer.parseInt(request.getParameter("idade"));
try {
	String sql = "INSERT INTO empregado(codigo, nome, idade) VALUES(?, ?, ?)";
	pst = con.prepareStatement(sql);
	
	pst.setInt(1, codigo);
	pst.setString(2, nome);
	pst.setInt(3, idade);
	pst.executeUpdate();
	System.out.println("Dados inseridos com sucesso!!!");
}

catch(SQLException sqle) {
	System.out.println("Não foi possível inserir os dados!!!");
}

%>
</body>
</html>
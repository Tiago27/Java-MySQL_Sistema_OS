package com.infox.dal;

import java.sql.*;

public class ModuloDeConexao {

    //método responsavel por estabelecer a conexão com o banco
    public static Connection conector() {
        //Variavel conexao do tipo java.sql.Connection 
        java.sql.Connection conexao = null;
        //A linha a baixo chama o driver que foi importado para a biblioteca
        String driver = "com.mysql.jdbc.Driver";
        //Armazenando informações referentes ao banco
        String url = "jdbc:mysql://localhost:3306/dbinfox";//endereço do banco de dados
        String user = "root";//caminho do banco de dados
        String password = "";//Senha do banco de dados
        //Estabelecer a conexão com o banco de dados
        try {
            Class.forName(driver);
            conexao = DriverManager.getConnection(url, user, password);
            
            return conexao;
        } catch (Exception e) {
            //A linha abaixo informa qual foi o erro
            //System.out.println(e);
            return null;
        }
    }
}

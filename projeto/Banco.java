package aula_heranca.projeto;
import java.sql.*;  
public class Banco {
    private static final String nomeBanco="rede_hospitalar";
    private static final String usuarioBanco="root";
    private static final String usuarioBancoSenha="";
    private static  Connection con;
    public static Connection getConexao(){
        if(Banco.con==null){
            final String stringConexao ="jdbc:mysql://127.0.0.1:3306/"+Banco.nomeBanco;
            try {
                Banco.con=DriverManager.getConnection(stringConexao,Banco.usuarioBanco,Banco.usuarioBancoSenha);  
            } catch (SQLException e){
                e.printStackTrace();
            }  
            
        }
        return con;
    }
}
package aula_heranca.projeto;
import java.sql.*;
public class Inserir extends Dados {
    public void logar (){
        String query = "Select * from login where UserName=? and Senha=? ";
        try {     
            PreparedStatement ps = Banco.getConexao().prepareStatement(query);
            ps.setString(1, this.getUserName());
            ps.setString(2, this.getSenha());
            ResultSet res = ps.executeQuery();
          
            while (res.next()) {
                System.out.println(res.getString("Cargo_idCargo"));
                this.setCargo(res.getString("Cargo_idCargo"));
            }
            System.out.println(this.getCargo());
            ps.close();
        }catch (SQLException se){
            System.out.println(se.getMessage());
        }
    }
    
}
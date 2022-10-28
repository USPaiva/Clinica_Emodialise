package aula_heranca.projeto;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.Toolkit;
import javax.swing.*;

public class Login extends JFrame{
    public static void main(String args[]){
        Inserir dados = new Inserir();
        Main princial = new Main();
        
        JFrame janela = new JFrame("Login");
        janela.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        //janela.setLocationRelativeTo(null);
        janela.setLocation(((Toolkit.getDefaultToolkit().getScreenSize().width  / 2) - (janela.getWidth() / 2)), ((Toolkit.getDefaultToolkit().getScreenSize().height / 2) - (janela.getHeight() / 2)));
        JPanel meuPainel = new JPanel();
        meuPainel.setLayout(null);


        

        JLabel NomeTexto = new JLabel();
        NomeTexto.setText("Digite seu Usuario:");
        NomeTexto.setBounds(30,10,200,25);

        JTextField NomeEscrever = new JTextField();
        NomeEscrever.setBounds(90, 35, 240, 25);

        JLabel senhatexto = new JLabel();
        senhatexto.setText("Digite sua Senha:");
        senhatexto.setBounds(30,60,100,25);

        JTextField senhaesc = new JPasswordField();
        senhaesc.setBounds(90, 85, 240, 25);

        JButton Login = new JButton();
        Login.setText("Login");
        Login.setBounds(140,125,120,25);
        Login.addActionListener(new ActionListener(){
            @Override
            public void actionPerformed(ActionEvent e) {
                String UserName = NomeEscrever.getText();
                String senha = senhaesc.getText();
                dados.setUserName(UserName);
                dados.setSenha(senha);
                dados.logar();
                if  (dados.getCargo() != null){
                    princial.Teste();
                    janela.setVisible(true);
                    janela.dispose();
                }else{
                    JOptionPane.showMessageDialog(null, "Login inválido", "Erro", JOptionPane.INFORMATION_MESSAGE);
                }
            }
        });
                

        meuPainel.add(NomeTexto);
        meuPainel.add(NomeEscrever);
        meuPainel.add(senhatexto);
        meuPainel.add(senhaesc);
        meuPainel.add(Login);
        

        janela.add(meuPainel);
        janela.setSize(400,200);
        janela.setVisible(true);

    }
}

package aula_heranca.projeto;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import javax.swing.*;
import java.awt.Toolkit;

public class Main extends JFrame{
    public void Teste(){
        int Telax = Toolkit.getDefaultToolkit().getScreenSize().width;
        int Telay = Toolkit.getDefaultToolkit().getScreenSize().height;
        JFrame janela = new JFrame("Painel Princial");
        janela.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        JPanel meuPainel = new JPanel();
        meuPainel.setLayout(null);
        

        JMenuBar mbrBarraMenu = new JMenuBar();
        JMenu jMenuarquivo = new JMenu(); 
        JMenu jMenuEditar = new JMenu();
        JMenuItem jMenuItemAbrir = new JMenuItem();
        JMenuItem jMenuItemSalvar = new JMenuItem(); 
        mbrBarraMenu.add(jMenuarquivo);
        jMenuarquivo.setText ("Opções");
        jMenuItemAbrir.setText ("Registrar Pessoa");
        jMenuarquivo.add(jMenuItemAbrir); 
        jMenuItemAbrir.addActionListener (new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                
                ///testes
                JLabel NomeTexto = new JLabel();
                NomeTexto.setText("Nome:");
                NomeTexto.setBounds(30,10,200,25);

                JTextField NomeEscrever = new JTextField();
                NomeEscrever.setBounds(90, 35, 240, 25);

                JButton Login = new JButton();
                Login.setText("Login");
                Login.setBounds(140,(Telay/2-100),120,25);
                Login.addActionListener(new ActionListener(){
                    @Override
                    public void actionPerformed(ActionEvent e) {
                       JOptionPane.showMessageDialog(null, "teste", "Erro", JOptionPane.INFORMATION_MESSAGE);
                    }
                });
                        

                meuPainel.add(NomeTexto);
                meuPainel.add(NomeEscrever);
                meuPainel.add(Login);

                janela.setSize(Telax/2 + 5, Telay/2+ 5);
                //
            }
        });
        jMenuEditar.setText ("Ajuda");
        jMenuItemSalvar.setText ("Salvar");
        jMenuEditar.add(jMenuItemSalvar); 
        mbrBarraMenu. add (jMenuEditar) ; 
        janela.setJMenuBar (mbrBarraMenu);

                


        

        janela.add(meuPainel);
        janela.setSize(Telax/2,Telay/2 );
        janela.setVisible(true);
        janela.setLocationRelativeTo(null);

    }
}

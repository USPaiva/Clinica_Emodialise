package aula_heranca.projeto;
import java.sql.Date;
import java.sql.Time;

public class Dados {
    //login
    private String UserName;
    private String senha;
    //Pessoa
    private String nome;
    private long cpf;
    private String RG;
    private String email;
    private Date dataNasc;
    // Telefone
    private long Telefone;
    private String TipoTel;
    //Paciente
    private String CNS;
    private String Etnia;
    private String profissao;
    private long NumeroProntuario;
    private String EstadoCivil;
    //Clinica
    private long CNPj;
    private String RazaoSocial;
    private String IE;
    //Funcionarios
    private Time HoraEntrada;
    private Time HoraSaida;
    private String CodigoCertificado;
    //Cargo
    private String Cargo;
    //Especialidade
    private String Especialidade;
    // Tipo Certificado
    private String TipoCertificado;
    //Endereço
    private long CEP;
    private String Cidade;
    private String Rua;
    //Exame
    private Date DataPedido;
    private Date DataResult;
    private String Tipo;
    //Sessao
    private String PressaoPre;
    private String PressaoPos;
    private double MedPerdaPeso;
    private double PesoSeco;
    private String Acesso;
    private String Filtracao;
    private String TesteCapilar;
    //Anamnese
    private Date DataPrimeiraDialise;
    private Date TerminoEstimado;
    private String FatorRH;
    private String DoencaCronica;
    private String Remedios;
    private String Alergia;
    private String CondicaoEspecial;
    private String Status;
    //IMC
    private double altura, peso;
    //Aplica Medicamento
    private int PreDialise, DuranteDialise, PosDialise;
    private String NomeMedicamento;


    //Aplica Medicamento
    public int getPreDialise() {
        return PreDialise;
    }
    public void setPreDialise(int preDialise) {
        PreDialise = preDialise;
    }
    public int getDuranteDialise() {
        return DuranteDialise;
    }
    public void setDuranteDialise(int duranteDialise) {
        DuranteDialise = duranteDialise;
    }
    public int getPosDialise() {
        return PosDialise;
    }
    public void setPosDialise(int posDialise) {
        PosDialise = posDialise;
    }
    public String getNomeMedicamento() {
        return NomeMedicamento;
    }
    public void setNomeMedicamento(String nomeMedicamento) {
        NomeMedicamento = nomeMedicamento;
    }
    //IMC
    public double IMC(){
        return peso/(altura*altura);
    }
    public double getAltura(){
        return altura;
    }
    public void setAltura(double altura){
        this.altura = altura;
    }
    public double getPeso(){
        return peso;
    }
    public void setPeso(double peso){
        this.peso = peso;
    }
    //Anamnese
    public Date getDataPrimeiraDialise() {
        return DataPrimeiraDialise;
    }
    public void setDataPrimeiraDialise(Date dataPrimeiraDialise) {
        DataPrimeiraDialise = dataPrimeiraDialise;
    }
    public Date getTerminoEstimado() {
        return TerminoEstimado;
    }
    public void setTerminoEstimado(Date terminoEstimado) {
        TerminoEstimado = terminoEstimado;
    }
    public String getFatorRH() {
        return FatorRH;
    }
    public void setFatorRH(String fatorRH) {
        FatorRH = fatorRH;
    }
    public String getDoencaCronica() {
        return DoencaCronica;
    }
    public void setDoencaCronica(String doencaCronica) {
        DoencaCronica = doencaCronica;
    }
    public String getRemedios() {
        return Remedios;
    }
    public void setRemedios(String remedios) {
        Remedios = remedios;
    }
    public String getAlergia() {
        return Alergia;
    }
    public void setAlergia(String alergia) {
        Alergia = alergia;
    }
    public String getCondicaoEspecial() {
        return CondicaoEspecial;
    }
    public void setCondicaoEspecial(String condicaoEspecial) {
        CondicaoEspecial = condicaoEspecial;
    }
    public String getStatus() {
        return Status;
    }
    public void setStatus(String status) {
        Status = status;
    }
    //Sessao
    public String getPressaoPre() {
        return PressaoPre;
    }
    public void setPressaoPre(String pressaoPre) {
        PressaoPre = pressaoPre;
    }
    public String getPressaoPos() {
        return PressaoPos;
    }
    public void setPressaoPos(String pressaoPos) {
        PressaoPos = pressaoPos;
    }
    public double getMedPerdaPeso() {
        return MedPerdaPeso;
    }
    public void setMedPerdaPeso(double medPerdaPeso) {
        MedPerdaPeso = medPerdaPeso;
    }
    public double getPesoSeco() {
        return PesoSeco;
    }
    public void setPesoSeco(double pesoSeco) {
        PesoSeco = pesoSeco;
    }
    public String getAcesso() {
        return Acesso;
    }
    public void setAcesso(String acesso) {
        Acesso = acesso;
    }
    public String getFiltracao() {
        return Filtracao;
    }
    public void setFiltracao(String filtracao) {
        Filtracao = filtracao;
    }
    public String getTesteCapilar() {
        return TesteCapilar;
    }
    public void setTesteCapilar(String testeCapilar) {
        TesteCapilar = testeCapilar;
    }
    //Exame
    public Date getDataPedido() {
        return DataPedido;
    }
    public void setDataPedido(Date dataPedido) {
        DataPedido = dataPedido;
    }
    public Date getDataResult() {
        return DataResult;
    }
    public void setDataResult(Date dataResult) {
        DataResult = dataResult;
    }
    public String getTipo() {
        return Tipo;
    }
    public void setTipo(String tipo) {
        Tipo = tipo;
    }
    //Endereço
    public long getCEP() {
        return this.CEP;
    }
    public void setCEP(long CEP) {
        this.CEP = CEP;
    }
    public String getCidade() {
        return Cidade;
    }
    public void setCidade(String cidade) {
        Cidade = cidade;
    }
    public String getRua() {
        return Rua;
    }
    public void setRua(String rua) {
        Rua = rua;
    }
    // Tipo Certificado
    public String getTipoCertificado() {
        return TipoCertificado;
    }
    public void setTipoCertificado(String tipoCertificado) {
        TipoCertificado = tipoCertificado;
    }
    //Especialidade
    public String getEspecialidade() {
        return Especialidade;
    }
    public void setEspecialidade(String especialidade) {
        Especialidade = especialidade;
    }
    //Cargo
    public String getCargo() {
        return Cargo;
    }
    public void setCargo(String cargo) {
        Cargo = cargo;
    }
    //Funcionarios
    public Time getHoraEntrada() {
        return HoraEntrada;
    }
    public void setHoraEntrada(Time horaEntrada) {
        HoraEntrada = horaEntrada;
    }
    public Time getHoraSaida() {
        return HoraSaida;
    }
    public void setHoraSaida(Time horaSaida) {
        HoraSaida = horaSaida;
    }
    public String getCodigoCertificado() {
        return CodigoCertificado;
    }
    public void setCodigoCertificado(String codigoCertificado) {
        CodigoCertificado = codigoCertificado;
    }
    //Clinica
    public String getRazaoSocial() {
        return RazaoSocial;
    }
    public void setRazaoSocial(String razaoSocial) {
        RazaoSocial = razaoSocial;
    }
    public String getIE() {
        return IE;
    }
    public void setIE(String iE) {
        IE = iE;
    }
    public long getCNPj() {
        return CNPj;
    }
    public void setCNPj(long cNPj) {
        CNPj = cNPj;
    }
    //Paciente
    public String getEstadoCivil() {
        return this.EstadoCivil;
    }
    public void setEstadoCivil(String estadoCivil) {
        this.EstadoCivil = estadoCivil;
    }
    public long getNumeroProntuario(){
        return this.NumeroProntuario;
    }
    public void setNumeroProntuario(long NumeroProntuario){
        this.NumeroProntuario = NumeroProntuario;
    }
    public String getProfissao(){
        return this.profissao;
    }
    public void setProfissao(String profissao){
        this.profissao = profissao;
    }
    public String getEtnia(){
        return this.Etnia;
    }
    public void setEtnia(String Etnia){
        this.Etnia = Etnia;
    }
    public String getCNS(){
        return this.CNS;
    }
    public void setCNS(String CNS){
        this.CNS = CNS;
    }

    //Telefone   
    public String getTipoTel(){
        return this.TipoTel;
    }
    public void setTipoTel(String Tipotel){
        this.TipoTel = Tipotel;
    }
    public long getTelefone(){
        return this.Telefone;
    }
    public void setTelefone(long Telefone){
        this.Telefone = Telefone;
    }

    // Pessoa
    public Date getDataNasc() {
        return this.dataNasc;
    }
    public void setDataNasc(Date dataNasc){
        this.dataNasc = dataNasc;
    }
    public String getRG(){
        return this.RG;
    }
    public void setRG(String RG){
        this.RG = RG;
    }
    public String getNome(){
        return this.nome;
    }
    public long getCpf(){
        return this.cpf;
    }
    public String getEmail(){
        return this.email;
    }
    public void setNome(String nome){
        this.nome = nome;
    }
    public void setCpf(long cpf){
        this.cpf = cpf;
    }
    public void setEmail(String email){
        this.email = email;
    }

    //login
    public String getUserName(){
        return this.UserName;
    }
    public void setUserName(String UserName){
        this.UserName = UserName;
    }
    public String getSenha(){
        return this.senha;
    }
    public void setSenha(String senha){
        this.senha = senha;
    }


    public void imprimeDadosPessoa(){
        System.out.println(getNome());
        System.out.println(getCpf());
        System.out.println(getEmail());
        System.out.println(getSenha());
    }
}
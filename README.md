# DSpace Installer (Descontinuado/Discontinued)
<i>Version 1.4</i>

> ### Aviso/Warning:
> Este repositório do DSpace Installer foi descontinuado. Entretanto, há um _fork_ sendo mantido no [repositório de @souzaluuk](https://github.com/souzaluuk/dspace-installer), onde há atualizações desde essa versão do _software_.

> This repository of DSpace Installer was discontinued. However, a fork have been maintained in [@souzaluuk repo](https://github.com/souzaluuk/dspace-installer), where there is updates since this version.


# O que é?
O DSpace Installer é uma série de scripts que automatizam o processo de instalação do DSpace 5.2. Atualmente o código-fonte do
DSpace que é utilizado com os scripts é o padrão distribuído nacionalmente pelo IBICT e remodelado por SEDEPTI, BC-UFPA, Brasil.

# Filosofia
Os scripts constantes nesse projeto visam automatizar o processo de instalação do DSpace em servidores baseados em Debian. A
principal ideia do DSpace Installer é oferecer simplicidade durante o processo de instalação, visando sempre que um usuário sem
conhecimentos da área técnica possa instalar seu prórpio repositório.

# Estrutura de diretórios
Para executar o DSpace Installer você precisa colocar os arquivos desse projeto em uma estrutura de diretórios organizada. Abaixo
segue a organização estrutural dos arquivos requerida para esta versão:

    # dspace[version]/
        # ... (dspace files) ...
        # dspace-installer.sh
        # dspace-setup/
            # dialog.sh
            # dspace-compiler.sh
            # dspace-dbuser.sh
            # dspace-install.sh
            # dspace-source.sh
            # dspace-webservices.sh
            # tomcat
            # verifier.sh
        # packages/
            # apache-ant[version].tar.gz
            # apache-maven[version].tar.gz
            # apache-tomcat[version].tar.gz
            # jdk[version].tar.gz
        # ... (dspace files) ...

Os pacotes apache-ant[version], apache-maven[version], apache-tomcat[version] e jdk[version] devem ser fornecidos juntos com o
contexto de instalação, pois o script principal (dspace-installer.sh) faz uso desses pacotes. A documentação completa das bibliotecas
e módulos usados na instalação pode ser encontrada na estrutura deste projeto.

# Pacotes de terceiros
O DSpace Installer faz uso de pacotes fornecidos por terceiros. Cada um desses pacotes possui sua própria documentação, suporte e
licenças de uso. Nós não damos suporte, endossamos ou temos qualquer outro tipo de responsabilidade sobre eles, portanto o uso
desses é completamente de sua responsabilidade. Recomendamos que você leia os termos de uso de cada pacote nas homepages dos
distribuidores:

    APACHE ANT: version 1.10.1, http://ant.apache.org/manual/index.html
    APACHE MAVEN: version 3.5.0, https://maven.apache.org/index.html
    APACHE TOMCAT: version 8.5.16, http://tomcat.apache.org/tomcat-8.5-doc/index.html
    JDK: version 8u131, http://www.oracle.com/technetwork/java/javase/documentation/index.html

# Contribuição
Nós incentivamos a contribuição com o código do DSpace Installer, portanto você é livre para melhorar o código e até sugerir novas
formas de implementar a instalação. A única coisa que pedimos é que você faça suas contribuições para esta comunidade afim de melhorar
e incentivar o desenvolvimento de atividades <i>backend</i> de repositórios digitais.

# Ambiente de desenvolvimento
Os scripts foram desenvolvidos sobre a versão 8.3-jessie do Debian. O sistena do servidor deve ter suporte ao gerenciador de pacotes
apt e aos comandos whiptail, sed, tar, cut e wc. Os pacotes de terceiros atualmente usados são os das seguintes versões:

    APACHE ANT: version 1.10.1
    APACHE MAVEN: version 3.5.0
    APACHE TOMCAT: version 8.5.16
    JDK: version 8u131

Não garantimos que o DSpace Installer fuincionará corretamente com outras versões desses pacotes.

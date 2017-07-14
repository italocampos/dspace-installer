# DSpace Installer
Version 1.4

Scripts de instalação do DSpace 5.2, padrão distribuído nacionalmente por IBICT.

# Descrição
Os scripts constantes nesse projeto visam automatizar o processo de instalação do Dspace 5.3 em servidores Debian (os scripts
foram desenvolvidos sobre a versão 8.3-jessie do sistema). A principal ideia do DSpace Installer é a simplicidade durante o 
processo de instalação, visando que um usuário sem conhecimentos da área técnica possa instalar seu prórpio repositório.

# Estrutura de diretórios e pacotes
O processo de instalação requer uma estrutura padrão de diretórios que está descrita abaixo:

# dspace5.3_sedepti/
     # ... (dspace files) ...
     # dspace-installer.sh
     # dspace-setup/
        # dialog.sh
        # dspace-compiler.sh
        # dspace-install.sh
        # dspace-source.sh
        # dspace-userdb
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
contexto de instalação, pois o script principal (dspace-installer.sh) faz chamadas constantes à esses arquivos. A documentação
completa das bibliotecas implementadas pode ser encontrada neste projeto.
Cada um desses pacotes possui sua própria documentação, suporte e licenças de uso. Nós não damos suporte, endossamos ou temos
qualquer outro tipo de responsabilidade sobre eles, portanto o uso desses deles é completamente de sua responsabilidade.
Recomendamos que você leia/entenda seus termos de uso nas homepages dos distribuidores:
APACHE ANT: version 1.10.1, http://ant.apache.org/manual/index.html; 
APACHE MAVEN: version 3.5.0, https://maven.apache.org/index.html;
APACHE TOMCAT: version 8.5.16, http://tomcat.apache.org/tomcat-8.5-doc/index.html;
JDK: version 8u131, http://www.oracle.com/technetwork/java/javase/documentation/index.html;

# Contribuição
Nós incentivamos a contribuição com o código do DSpace Installer, portanto você é livre para sugerir novas formas de implementar
a instalação. A única coisa que pedimos em é que você contribua também em comunidade para melhorar e incentivar o desenvolvimento
de atividades 'backend' de repositórios digitais.

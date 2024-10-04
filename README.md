# docker_install_ole
instalação docker proxy e encoder<p>
Para instalação do proxy e do encoder, é aconselhado o uso do Ubuntu 18.05 ou 20.04 limpo, sem nenhuma instalação extra, a versão 22.04 contem muitos problemas de pacotes<p>
<p>
** 1 - Instalação de encoder, ele irá instalar todos os driver do encoder para placa de vídeo atualizados, ao finalizar reinicie o servidor<p>
server#: sh install_docker.sh<p>
<p>
acesse via web:<p>
http://[ip_do_servidor]:280/encoder/<p>
Usuário: admin<p>
Senha: [solicite a senha]<p>
<p>
** 2 - Instalação do proxy, é uma instalação mais simples e rápida<p>
server#: sh istall_proxy.sh<p>
<p>
acesse via web:<p>
http://[ip_do_servidor]:280/proxy/<p>
Usuário: admin<p>
Senha: [solicite a senha]<p>

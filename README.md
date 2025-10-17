<div align="center">
  <img src="https://raw.githubusercontent.com/wmnutec/nutec/main/icon.png" alt="Logo WM Saúde" width="400"/>
  <h1 align="center">Centro de Operações e Conhecimento - Setor Nutec</h1>
  <p align="center">
    <strong>A fonte única da verdade para processos, ferramentas e infraestrutura da equipe de TI na WM Saúde.</strong>
    <br />
    <a href="mailto:wmnutec@gmail.com"><strong>Contato Institucional: wmnutec@gmail.com</strong></a>
  </p>
</div>

---

### 🎯 Nossa Missão

Este repositório é o pilar central da nossa organização. Ele foi criado para documentar e padronizar nosso ecossistema tecnológico, desde a gestão de incidentes até a automação de tarefas e a arquitetura da nossa infraestrutura. O objetivo é claro: operar com **eficiência, segurança e profissionalismo**, garantindo que todo conhecimento seja centralizado e acessível.

---

### 🏛️ Nosso Ecossistema de Ferramentas: O que usamos e por quê

Nossa operação é sustentada por um conjunto de ferramentas estratégicas. Cada uma tem um propósito claro. Clique em qualquer uma delas para acessar.

---

### 1. ClickUp: Nosso Ponto de Partida

<a href="https://app.clickup.com/" target="_blank">
  <img src="https://img.shields.io/badge/GESTÃO_DE_TAREFAS-7B68EE?style=for-the-badge&logo=clickup&logoColor=white" alt="ClickUp"/>
</a>

-   **O que é?** É a nossa plataforma de gestão de projetos e tarefas.
-   **Para que usamos?** É aqui que **todo o trabalho começa**. Seja um chamado de suporte, um bug para corrigir ou um novo projeto de infraestrutura, ele nasce como uma tarefa no ClickUp. Usamos para saber quem está fazendo o quê, quais são as prioridades e quando as coisas serão entregues.
-   **Regra de Ouro:** Se não está no ClickUp, não existe. Todo trabalho realizado deve estar vinculado a uma tarefa.

---

### 2. Bitwarden: Nosso Cofre de Segurança

<a href="https://vault.bitwarden.com/" target="_blank">
  <img src="https://img.shields.io/badge/SEGURANÇA-175DDC?style=for-the-badge&logo=bitwarden&logoColor=white" alt="Bitwarden"/>
</a>

-   **O que é?** É um gerenciador de senhas seguro.
-   **Para que usamos?** Para armazenar e compartilhar de forma segura **todas** as credenciais de acesso: senhas de servidores, logins de sistemas, chaves de API, etc. Ele nos permite usar senhas fortes e únicas para cada serviço sem precisar memorizá-las.
-   **Regra de Ouro:** NUNCA salve ou compartilhe senhas em planilhas, bloco de notas ou WhatsApp. O Bitwarden é a **única** forma permitida.

---

### 3. Google Drive: Nosso Arquivo de Provas

<a href="https://drive.google.com/" target="_blank">
  <img src="https://img.shields.io/badge/ARQUIVOS_DINÂMICOS-4285F4?style=for-the-badge&logo=googledrive&logoColor=white" alt="Google Drive"/>
</a>

-   **O que é?** É o nosso sistema de armazenamento em nuvem para documentos.
-   **Para que usamos?** É onde guardamos os "artefatos" do nosso trabalho. Um relatório de visita assinado em PDF, uma planilha de inventário preenchida, um termo de entrega. Pense nele como o nosso cartório digital, onde os registros e as provas do trabalho executado são armazenados.
-   **Regra de Ouro:** O Drive é para arquivos finais e documentos de trabalho. Ele não substitui o ClickUp para gestão de tarefas nem o GitHub para códigos.

---

### 4. Proxmox VE: Nossa Fábrica de Servidores

<a href="https://pve.blusy.com.br" target="_blank">
  <img src="https://img.shields.io/badge/INFRAESTRUTURA-E97B00?style=for-the-badge&logo=proxmox&logoColor=white" alt="Proxmox VE"/>
</a>

-   **O que é?** É uma plataforma de virtualização. Em termos simples, é um "sistema operacional para servidores".
-   **Para que usamos?** Ao invés de termos dezenas de máquinas físicas, temos um único servidor físico robusto rodando o Proxmox. Dentro dele, criamos "servidores virtuais" (VMs) isolados para cada finalidade (como a VM Gateway para segurança e a VM Aplicações para nossos sistemas). Isso nos dá agilidade para criar, modificar e gerenciar nossos servidores de forma centralizada e segura.
-   **Regra de Ouro:** O acesso ao Proxmox é restrito e considerado crítico. Toda e qualquer alteração deve ser planejada e documentada. A documentação da nossa arquitetura Proxmox fica no diretório [`/sistemas`](./sistemas/).

---

### 5. GitHub: Nosso Cérebro e Caixa de Ferramentas

<a href="https://github.com/wmnutec/nutec" target="_blank">
  <img src="https://img.shields.io/badge/CÓDIGO_E_PROCESSOS-181717?style=for-the-badge&logo=github&logoColor=white" alt="GitHub"/>
</a>

-   **O que é?** É uma plataforma para hospedar e versionar códigos e documentações.
-   **Para que usamos?** É aqui que a "inteligência" da nossa operação é construída e guardada. Este repositório é o nosso cérebro coletivo.
    -   **Scripts e Automações:** Ferramentas que criamos para facilitar nosso trabalho (como o `Inventario.ps1`) ficam no diretório [`/scripts`](./scripts/).
    -   **Documentação Técnica:** Manuais, guias de arquitetura e processos (como este que você está lendo) vivem aqui.
    -   **Código-Fonte:** O código HTML dos nossos formulários, as configurações do nosso servidor (IaC), tudo que é "escrito" para fazer a mágica acontecer, é guardado aqui.
-   **Regra de Ouro:** Se algo pode ser transformado em um script ou em um processo documentado, seu lugar é aqui. O GitHub é para o "como" fazemos, enquanto o Google Drive é para o "o que" foi feito.

---

<div align="center">
  <em>Este documento é um recurso vivo. A responsabilidade de mantê-lo preciso e atualizado é de toda a equipe.</em>
</div>
import '../models/belt.dart';
import '../models/bjj_position.dart';
import '../models/prohibited_technique.dart';

const positions = <BjjPosition>[
  BjjPosition(id:'queda', belt:Belt.white, name:'Queda', points:2, status:'Permitido', image:'assets/images/closed_guard_real.jpg', description:'Levar o adversário ao chão e terminar por cima com controle.', criteria:['Começar normalmente com ambos em pé.','Consolidar controle por pelo menos 3 segundos.','Não cair em finalização encaixada.'], commonMistakes:['Derrubar sem estabilizar.','Cair por baixo após a queda.']),
  BjjPosition(id:'raspagem', belt:Belt.white, name:'Raspagem', points:2, status:'Permitido', image:'assets/images/half_guard_real.jpg', description:'Inverter a posição partindo da guarda e terminar por cima.', criteria:['Iniciar a ação de dentro da guarda.','Finalizar por cima com domínio.','Estabilizar por 3 segundos.'], commonMistakes:['Levantar sem controle.','Confundir reversão fora da guarda com raspagem.']),
  BjjPosition(id:'joelho_barriga', belt:Belt.white, name:'Joelho na barriga', points:2, status:'Permitido', image:'assets/images/knee_mount_real.jpg', description:'Controle com joelho no tronco do adversário.', criteria:['Manter joelho na linha do tronco.','Postura dominante.','Controle por 3 segundos.'], commonMistakes:['Joelho muito baixo.','Peso sem controle real.']),
  BjjPosition(id:'passagem', belt:Belt.white, name:'Passagem de guarda', points:3, status:'Permitido', image:'assets/images/side_control_real.jpg', description:'Superar as pernas do adversário e controlar lateralmente.', criteria:['Sair da guarda ou meia-guarda.','Controlar lateralmente ou norte-sul.','Estabilizar por 3 segundos.'], commonMistakes:['Passar e perder controle.','Não liberar a perna presa.']),
  BjjPosition(id:'montada', belt:Belt.white, name:'Montada', points:4, status:'Permitido', image:'assets/images/mount_real.jpg', description:'Controle por cima com joelhos ao redor do tronco.', criteria:['Dois joelhos no solo ou controle equivalente.','Quadril dominante.','Estabilizar por 3 segundos.'], commonMistakes:['Subir sem controle de quadril.','Cruzar pés de forma perigosa.']),
  BjjPosition(id:'costas', belt:Belt.white, name:'Pegada pelas costas', points:4, status:'Permitido', image:'assets/images/back_mount_real.jpg', description:'Controle das costas com ganchos ou domínio equivalente.', criteria:['Controlar as costas.','Inserir dois ganchos ou controle válido.','Manter domínio por 3 segundos.'], commonMistakes:['Gancho solto.','Perder o peito colado nas costas.']),
  BjjPosition(id:'arm_lock', belt:Belt.white, name:'Chave de braço reta', points:0, status:'Permitido', image:'assets/images/armbar_real.jpg', description:'Finalização reta no cotovelo, permitida em regra geral com execução segura.', criteria:['Ataque sem torção cervical.','Controle do braço.','Aplicação progressiva.'], commonMistakes:['Perder o polegar alinhado.','Cruzar as pernas errado.']),
  BjjPosition(id:'americana', belt:Belt.white, name:'Americana', points:0, status:'Permitido', image:'assets/images/udegarami_real.jpg', description:'Finalização de ombro comum em controle lateral ou montada.', criteria:['Controle do punho e cotovelo.','Movimento controlado.','Sem torção ilegal.'], commonMistakes:['Braço do adversário muito baixo.','Perder pressão do tronco.']),
  BjjPosition(id:'triangulo', belt:Belt.blue, name:'Triângulo', points:0, status:'Permitido', image:'assets/images/closed_guard_real.jpg', description:'Estrangulamento usando as pernas a partir da guarda.', criteria:['Isolar cabeça e braço.','Ajustar ângulo.','Fechar pressão de forma progressiva.'], commonMistakes:['Ficar reto.','Não cortar o ângulo.']),
  BjjPosition(id:'omoplata', belt:Belt.blue, name:'Omoplata', points:0, status:'Permitido', image:'assets/images/armbar_real.jpg', description:'Ataque ao ombro com controle de quadril.', criteria:['Controlar postura.','Evitar rolagem adversária.','Finalizar de modo progressivo.'], commonMistakes:['Soltar a cintura.','Não sentar para finalizar.']),
  BjjPosition(id:'guarda_de_la_riva', belt:Belt.blue, name:'Guarda De La Riva', points:0, status:'Permitido', image:'assets/images/half_guard_real.jpg', description:'Guarda aberta com gancho externo para controle e raspagens.', criteria:['Controle de manga/lapel.','Gancho ativo.','Manter distância segura.'], commonMistakes:['Gancho morto.','Deixar o passador estabilizar.']),
  BjjPosition(id:'berimbolo', belt:Belt.purple, name:'Berimbolo', points:0, status:'Permitido', image:'assets/images/back_mount_real.jpg', description:'Transição invertida para costas ou controle dominante.', criteria:['Entrada segura.','Controle de quadril.','Finalizar em costas ou vantagem posicional.'], commonMistakes:['Inverter sem pegada.','Expor o pescoço.']),
  BjjPosition(id:'x_guard', belt:Belt.purple, name:'Guarda X', points:0, status:'Permitido', image:'assets/images/half_guard_real.jpg', description:'Guarda de controle inferior com alavancas nas pernas.', criteria:['Controlar a base adversária.','Entrar sob o centro de gravidade.','Buscar raspagem ou costas.'], commonMistakes:['Ficar longe do quadril.','Não controlar uma manga ou perna.']),
  BjjPosition(id:'toe_hold', belt:Belt.brown, name:'Toe Hold', points:0, status:'Permitido conforme categoria', image:'assets/images/udegarami_real.jpg', description:'Finalização no pé com torção permitida apenas em níveis específicos.', criteria:['Respeitar categoria e faixa.','Aplicar progressivamente.','Sem movimento explosivo.'], commonMistakes:['Usar em faixa não permitida.','Torcer sem controle.']),
  BjjPosition(id:'kneebar', belt:Belt.brown, name:'Knee Bar', points:0, status:'Permitido conforme categoria', image:'assets/images/armbar_real.jpg', description:'Chave reta no joelho para faixas/categorias permitidas.', criteria:['Linha reta da articulação.','Controle de quadril.','Regra da categoria validada.'], commonMistakes:['Confundir com heel hook.','Atacar em divisão proibida.']),
  BjjPosition(id:'leg_drag', belt:Belt.black, name:'Leg Drag', points:0, status:'Permitido', image:'assets/images/side_control_real.jpg', description:'Controle de passagem usando arrasto de pernas.', criteria:['Controlar quadril.','Bloquear recomposição.','Consolidar lateral ou costas.'], commonMistakes:['Deixar gancho voltar.','Não estabilizar a passagem.']),
  BjjPosition(id:'mata_leao', belt:Belt.black, name:'Mata-leão', points:0, status:'Permitido', image:'assets/images/back_mount_real.jpg', description:'Estrangulamento pelas costas com controle dominante.', criteria:['Controlar costas.','Fechar braço corretamente.','Pressão progressiva.'], commonMistakes:['Forçar mandíbula.','Perder os ganchos cedo.']),
];

const prohibited = <ProhibitedTechnique>[
  ProhibitedTechnique(belt:Belt.white, name:'Heel Hook', reason:'Ataque de torção no joelho proibido.'),
  ProhibitedTechnique(belt:Belt.white, name:'Knee Bar', reason:'Chave de joelho não permitida para iniciantes.'),
  ProhibitedTechnique(belt:Belt.white, name:'Toe Hold', reason:'Ataque avançado ao pé.'),
  ProhibitedTechnique(belt:Belt.white, name:'Bate-estaca', reason:'Risco alto de impacto cervical.'),
  ProhibitedTechnique(belt:Belt.blue, name:'Heel Hook', reason:'Continua proibido no Gi.'),
  ProhibitedTechnique(belt:Belt.blue, name:'Bate-estaca', reason:'Movimento perigoso.'),
  ProhibitedTechnique(belt:Belt.purple, name:'Heel Hook', reason:'Restrição comum em regras de Gi.'),
  ProhibitedTechnique(belt:Belt.brown, name:'Heel Hook', reason:'Restrição em competições de Gi.'),
  ProhibitedTechnique(belt:Belt.black, name:'Bate-estaca', reason:'Técnica de alto risco.'),
];

const scoreRules = [
  'Queda: 2 pontos',
  'Raspagem: 2 pontos',
  'Joelho na barriga: 2 pontos',
  'Passagem de guarda: 3 pontos',
  'Montada: 4 pontos',
  'Pegada pelas costas: 4 pontos',
  'A posição precisa ser estabilizada antes da pontuação.',
];

import 'package:flutter/material.dart';
import 'package:flutter_app/utils/bar_navegacion.dart';
import 'package:flutter_app/utils/screen_utils.dart';
import 'package:flutter_app/utils/widget_circulo.dart';
import 'package:flutter_app/utils/widget_grid_cir.dart';

class Terminos extends StatelessWidget {
  const Terminos({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double multiplier = ResponsiveUtil.getMultiplier(context);

    return Scaffold(
      body: SizedBox(
        width: width,
        height: height,
        child: Stack(children: [
          const Positioned(
            left: -200,
            bottom: 1000,
            child: SizedBox(
              width: 800,
              height: 800,
              child: Circumference(
                opacity: 100,
              ),
            ),
          ),
          const Positioned(
            right: 90,
            bottom: 1000,
            child: SizedBox(
              width: 145,
              height: 80,
              child: CirculosEnGrid(),
            ),
          ),
          const Positioned(
            left: -200,
            bottom: 1100,
            child: SizedBox(
              width: 600,
              height: 600,
              child: Circumference3(
                widthC: 700,
                heightC: 645.04,
                opacity: 225,
              ),
            ),
          ),
          const Positioned(
            right: -250,
            top: 1000,
            child: SizedBox(
              width: 800,
              height: 800,
              child: Circumference(
                opacity: 100,
              ),
            ),
          ),
          const Positioned(
            left: 90,
            top: 950,
            child: SizedBox(
              width: 145,
              height: 80,
              child: CirculosEnGrid(),
            ),
          ),
          const Positioned(
            right: -300,
            top: 1100,
            child: SizedBox(
              width: 600,
              height: 600,
              child: Circumference3(
                widthC: 700,
                heightC: 645.04,
                opacity: 225,
              ),
            ),
          ),
          const Positioned(
            left: -200,
            top: -250,
            child: SizedBox(
              width: 800,
              height: 800,
              child: Circumference(
                opacity: 100,
              ),
            ),
          ),
          const Positioned(
            right: 90,
            top: 290,
            child: SizedBox(
              width: 145,
              height: 80,
              child: CirculosEnGrid(),
            ),
          ),
          const Positioned(
            left: -200,
            top: -270,
            child: SizedBox(
              width: 600,
              height: 600,
              child: Circumference3(
                widthC: 700,
                heightC: 645.04,
                opacity: 225,
              ),
            ),
          ),
          const Positioned(
            right: -200,
            bottom: -250,
            child: SizedBox(
              width: 800,
              height: 800,
              child: Circumference(
                opacity: 100,
              ),
            ),
          ),
          const Positioned(
            left: 90,
            bottom: 290,
            child: SizedBox(
              width: 145,
              height: 80,
              child: CirculosEnGrid(),
            ),
          ),
          const Positioned(
            right: -200,
            bottom: -270,
            child: SizedBox(
              width: 600,
              height: 600,
              child: Circumference3(
                widthC: 700,
                heightC: 645.04,
                opacity: 225,
              ),
            ),
          ),
          Positioned(
            child: ListView.builder(
              itemCount: terms.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 120.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        terms[index]['header']!,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        padding: const EdgeInsets.all(20),
                        width: 900,
                        child: Text(terms[index]['paragraph']!,
                            style: const TextStyle(fontSize: 16),
                            textAlign: TextAlign.justify),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          Positioned(
            right: 50 * multiplier,
            top: 0 * multiplier,
            child: SizedBox(
              width: 900 * multiplier,
              height: 70 * multiplier,
              child: BarNavi(),
            ),
          ),
        ]),
      ),
    );
  }
}

final List<Map<String, String>> terms = [
  {
    'header': 'Términos de Compra',
    'paragraph':
        '''Man Cave Autographs, es una plataforma digital en sitio web ya sea a través de dispositivos fijos y/o móvil y otros productos y servicios cuando visita www.mancaveautographs.mx como se describe en las definiciones y siguientes condiciones, operada por Man Cave Autographs SA de CV
En lo sucesivo encontrarás los Términos y Condiciones aplicables a las operaciones de compra de boletos en la plataforma, mismas que al utilizar el servicio usted está expresamente aceptando las condiciones que se describen a lo largo de los presentes términos y condiciones.
El comprador reconoce que Man Cave Autographs tiene una relación jurídica con el Organizador del evento del que el comprador está realizando la compra.
A través de los presentes Términos y Condiciones el comprador de boletos para el evento tiene conocimiento de:
1.	Man Cave Autographs en conjunto con Meet and Greet Experience México, es un agente del organizador, quien autoriza que el evento aparezca en la plataforma Digital de Man Cave Autographs, así como facilitar los servicios de cobro y entrega de boletos a los compradores, motivo por el cual, al ser comprado un boleto, la relación jurídica será entre el comprador y el organizador.
2.	Toda la facturación relativa a la venta de boletos a los compradores será efectuada por el organizador directamente a los compradores. Independientemente de lo anterior Man Cave Autographs facturará al organizador el monto que éste llegue a retener por concepto de comisión, más los impuestos aplicables.
3.	Man Cave Autographs, realizará la dispersión de los ingresos a los organizadores motivo por el cual, en el caso de una cancelación del evento por el organizador, la solicitud de reembolso se realizará directamente al organizador.
El presente documento describe los Términos y Condiciones generales aplicables a los servicios ofrecidos de operaciones de organización de eventos. Cualquier persona que desee acceder y/o usar la plataforma digital y sus servicios podrá hacerlo sujetándose a los Términos y Condiciones, junto con todas las demás políticas y principios que rigen a Man Cave Autographs, y que son incorporados al siguiente documento.
Es necesario leer los siguientes términos y condiciones de servicio, ya que  contienen información importante respecto a tus derechos y obligaciones como usuario y/o comprador, el desconocimiento, o falta de lectura de lo aquí contenido no exime de responsabilidad al usuario y/o comprador, ni lo excluye del alcance.
En lo sucesivo encontrarás los términos y condiciones que aceptas al efectuar las siguientes acciones (i) Al comprar boletos por medio de Mancaveautographs.mx, tomando en consideración lo dispuesto en el artículo 1803 del Código Civil Federal, los presentes términos y condiciones son consentidos de forma tácita en el entendido que de conformidad al citado artículo “el consentimiento puede ser expreso o tácito, para ello se estará a lo siguiente:
•	I.- Será expreso cuando la voluntad se manifiesta verbalmente, por escrito, o por medios electrónicos.
•	II.- El tácito resultará de hechos o de actos que lo presupongan o que autoricen a presumirlo, excepto en los casos en que por ley o por convenio la voluntad te va a manifestarse expresamente”, por lo que en el entendido de que lleves a cabo la generación de un usuario registrado, será suficiente para que tu consentimiento se dé de forma expresa y el uso de la plataforma digital será una manifestación tácita de tu consentimiento.
Cualquier persona que no acepte estos términos y condiciones generales, los cuales tienen un carácter obligatorio y vinculante deberá abstenerse de utilizar el sitio y o los servicios. El uso del sitio y la aceptación a estos términos y condiciones tendrá la misma fuerza legal que una firma autógrafa y podrá ser elegible como prueba judicial en caso de controversia.
'''
  },
  {
    'header': '1.- Definiciones',
    'paragraph':
        '''Las siguientes palabras deberán de ser interpretadas como se describe para efectos de diferenciación, los términos que en lo sucesivo se definen serán descritos con la primera letra en mayúscula y únicamente cuando se utilicen en dicho formato es cuando deberán de interpretarse como tales.
•	a. Características de los eventos y boletos que Man Cave Autographs maneja: Los eventos organizados podrán tener sus propios datos y utilizar tipos de boleto de distintas características. Estos boletos deberán indicar, como mínimo; nombre, costo, cantidad a la venta.
•	b. Métodos de pago para los compradores de compradores: La persona encargada de organizar el evento que deseas comprar podrá elegir que puedas realizar tu pago con tarjeta de crédito, o en depósito bancario (algunos métodos de pago no estarán habilitados en los días próximos al evento, dependiendo de cada evento).
•	c. General: El organizador ha permitido que Man Cave Autographs, podrá actuar en su nombre para cobrar el monto total del boleto adquirido incluyendo los impuestos aplicables, a su vez, acepta que fungirá como un agente de ventas por comisión. Man Cave Autographs, en el desempeño de su encargo, recibirá la totalidad de los montos pagados por parte de los compradores y entregará al Organizador el remanente después de retener las contraprestaciones acordadas.
•	d. Facturación: Toda la facturación relativa a la venta de boletos a los compradores será efectuada por el Organizador directamente a los compradores.
•	e. Organizador: Se refiere a los usuarios registrados que utilizan la plataforma digital para vender boletos de eventos cuya organización está bajo su encargo. El Organizador puede ser una persona física o moral y el evento puede ser en Streaming o Físico.
•	f. Compradores: Se refiere a los usuarios que utilizan la plataforma digital para comprar boletos de un evento, de algún Organizador, en donde Man Cave Autographs, les asignará un boleto de acceso.
•	g. Contracargos: Un contracargo es un mecanismo creado por el Banco de México, que permite solucionar cualquier disputa sobre cargos hechos a una tarjeta de crédito o débito. Es una manera de poder proteger al tarjetahabiente (titular de una tarjeta) de posibles cargos hechos sin su consentimiento.
•	h. Plataforma Digital: Se refiere al sistema para la compra venta de boletos alojada en www.mancaveautographs.mx
•	i. Usuarios: Cualquier persona que utilice y/o navegue la plataforma digital ya sea Organizador, comprador o turista Cibernético.
•	j. Evento: Se refiere al servicio que el Organizador pone a la venta y que deseas comprar, mismo servicio que puede ser una actividad, concierto, o información que pueda ser consumida en físico, o a través de una plataforma de streaming.
•	k. Validación de compra. Facultad de Man Cave Autographs, para poder solicitar información al usuario/tarjetahabiente respecto de cualquier compra en la plataforma. Dicha información deberá ser entregada a más tardar a los tres días de ser solicitada y tendrá por objeto únicamente evitar la realización de fraude.
•	l. Eventos y contenido en Sreaming: Se refiere al contenido para el que se compra un boleto, y cuyo contenido se transmite por vía remota, pudiendo alojarse en alguna página cuyo dominio corresponda a Man Cave Autographs u otra.
'''
  },
  {
    'header': '2. Personalidad, Domicilio, Descripción y Ámbito del servicio.',
    'paragraph':
        '''(i) Man Cave Autographs S.A de C.V. es una es una Sociedad Anónima de Capital Variable(ii) con domicilio en Centro Comercial Interlomas, Boulevard interlomas #5 Centro Urbano, San Fernando, Huixquilucan, Estado de México, C.P. 52786, (iii) que opera los servicios prestados por conducto de la Plataforma Digital(iv) en donde está alojado un sistema que facilita la publicación de eventos, así como la compraventa de boletos.
Por virtud de los presentes términos y condiciones Man Cave Autographs realizará las actividades de un agente comercial, cuyo servicio será únicamente el contratado por el Organizador, sin que de ninguna manera se entienda que el servicio que realizará Man Cave Autographs es una comisión mercantil.
Esto es, de ninguna manera se entenderá que Man Cave Autographs realiza actividades por nombre y a cuenta del Organizador, motivo por el cual cuando un comprador realice la contratación de un evento realizado con el Organizador, el contrato se entenderá realizado entre ambos, y de ninguna manera existirá contrato entre Man Cave Autographs y el comprador.
Por ello, por virtud de los presentes términos y condiciones, el comprador entiende que la relación contractual la tiene con el Organizador, ya que Man Cave Autographs, es sólo un medio para la adquisición de los boletos del evento.
'''
  },
  {
    'header': '3. Elegibilidad',
    'paragraph':
        '''La Plataforma Digital, tienen el objetivo de ser utilizados únicamente por personas mayores de edad que tengan 18 (dieciocho) años cumplidos o más, cualquier uso realizado por un menor de edad es estrictamente prohibido. Los Usuarios al acceder al Sitio afirman y garantizan tener edad legal para contratar y estar en pleno uso de sus facultades y capacidades. Por el simple hecho de ser un Usuario de la Plataforma Digital, conscientes que al acceder a nuestro portal aceptas todos los términos de privacidad, seguridad y reglamentos de Man Cave Autographs. A su vez se manifiesta que es mayor de edad y con capacidad para contratar de lo contrario solicitamos que abandones nuestro sitio.''',
  },
  {
    'header': '4. Territorio',
    'paragraph':
        '''Los Servicios prestados por Man Cave Autographs deberán de entenderse como servicios prestados en la República Mexicana sin importar en donde fueron originados o solicitados.''',
  },
  {
    'header': '5. General',
    'paragraph':
        '''•	a. Estos términos y condiciones le son aplicables a todos los Usuarios Registrados en la modalidad de Comprador
•	b. Los Usuarios, aceptan todos los términos de privacidad, seguridad y reglamentos de Man Cave Autographs.
'''
  },
  {
    'header': '6. Descripción del Servicio',
    'paragraph':
        '''Man Cave Autographs, es propietario y operador de la Plataforma Digital misma que tiene por objeto que un Organizador pueda poner a la venta los boletos para cualquier tipo de evento físico o digital, según corresponda.
Mediante la Plataforma Digital el consumidor decide comprar o adquirir boletos que le permitan el ingreso al evento que haya considerado, mismo que podrá realizarse de manera presencial o remota (vía streaming) según la descripción que haya realizado el organizador.
'''
  },
  {
    'header': '7. Precios y Pagos',
    'paragraph':
        '''•	i. El Precio de los boletos será aquel que publiquen los Organizadores en los Subdominios (.Man Cave Autographs) correspondiente al evento organizado, más el Impuesto al Valor Agregado y en su caso las comisiones que los Organizadores de eventos designen.
•	ii. Para efectos de estos Términos y Condiciones, el Comprador consiente que todos los pagos en relación a la adquisición de boletos deberán de ser efectuados en cualquiera de las modalidades de pago que se encuentre habilitado para el evento.
•	iii. Todo cargo generado por medio de tarjeta de crédito y/o débito, y que no sea Paypal se suscribe a las regulaciones de BANXICO sobre procesamiento de cargos por internet.
'''
  },
  {
    'header': '8. Aceptación de los términos de condición.',
    'paragraph':
        '''•	a. Los Usuarios aceptan los términos y condiciones aquí contenidos.
•	b. Los términos y condiciones son consentidos al momento de realizar el pago.
•	c. Los Usuarios reconocen la formalidad de este escrito y el alcance de las obligaciones a pesar de que sean de naturaleza digital.
'''
  },
  {
    'header':
        '9. Términos y Condiciones de Uso de la Plataforma Digital para compra.',
    'paragraph':
        '''•	a. El Usuario reconoce que el uso de la Plataforma Digital no le otorga ningún derecho de propiedad sobre el mismo, cualquiera de sus elementos o contenidos.
•	b. Todos los Contenidos son propiedad de Man Cave Autographs, sin que pueda entenderse que el uso o acceso a la Plataforma Digital, le atribuyan al Usuario o comprador derecho alguno sobre los mismos.
•	d. El Usuario se obliga a no utilizar técnicas de ingeniería inversa, hackear o intervenir tecnológicamente con el uso de herramientas digitales o software.
•	e. Todo uso no autorizado de la Plataforma Digital en virtud de estos términos y condiciones puede traer como consecuencias las sanciones aquí contenidas y las contempladas por el marco legal vigente.
•	f. Man Cave Autographs se reserva el derecho de realizar las acciones que por derecho le correspondan para verificar el cumplimiento de los términos y condiciones.
•	g. En caso de que el Usuario viole lo dispuesto en los términos y condiciones y particularmente este apartado, deberá indemnizar a Man Cave Autographs por todos los daños y perjuicios que se le ocasionen en virtud de la violación o incumplimiento.
•	i. El comprador reconoce que Man Cave Autographs emplea sistemas anti fraude con el objeto de evitar que se realicen compras fraudulentas con datos de terceros, motivo por el cual podrá cancelar la emisión de boletos, sin que esto implique responsabilidad para Man Cave Autographs, en todo caso el comprador podrá validar su compra en otro momento.
•	j. El comprador acepta que no podrá compartir su boleto electrónico por medio de redes sociales, internet, o por cualquier otro medio, ya que ello implica el riesgo de ser utilizado por alguien más, en cuyo caso, Man Cave Autographs no será responsable de la reposición o entrada del comprado al evento, ya que es responsabilidad del comprador el correcto resguardo de su boleto hasta el dia del evento.
'''
  },
  {
    'header': '10. Obligaciones del Comprador',
    'paragraph':
        '''•	a. El Comprador manifiesta que reconoce el alcance de estos términos y condiciones y que toda la información proveída es veraz y que no hay impedimentos legales para contratar.'''
  },
  {
    'header': '11. Deslinde de responsabilidad',
    'paragraph':
        '''•	a. Man Cave Autographs no se hace responsable por cancelación de eventos por cambios de fecha, cancelación de uno o varios talentos que asisten al evento, es responsabilidad de los Compradores validar el estado que guardan los eventos por los cuales adquirieron o adquirirán boletos, misma razón por la que Man Cave Autographs no es responsable del contenido o logística de los eventos.
•	b. En el caso de cancelación de eventos o eventos que sean post fechados, el Organizador hará del conocimiento del comprador la cancelación y/o modificación en la fecha del evento.
•	c. Man Cave Autographs no se hace responsable de ningún costo, daño o perjuicio que se ocasione por cancelación o aplazamiento de eventos, toda la responsabilidad estará a cargo de los Organizadores y operadores del recinto en donde el evento fuera a llevarse a cabo, situación aceptada por los Organizadores en los términos y condiciones aceptados por ellos.
•	d. Man Cave Autographs, no será responsable de las pérdidas o daños causados a los clientes de los eventos, ello derivado de que tal y como ya fue establecido en estos Términos y Condiciones, la contratación es directa entre los Compradores y el Organizado, siendo Man Cave Autographs, sólo un agente.
•	e. Ante una cancelación de evento, el Organizador tiene la obligación de notificar a Man Cave Autographs dicha situación en un plazo no mayor a 3 días, el Organizador será el responsable del reembolso del costo a Man Cave Autographs. Dicho lo anterior Man Cave Autographs es el responsable de efectuar el reembolso al comprador únicamente cuando Man Cave Autographs tenga aún el dinero de los boletos comprados, y no haya hecho la dispersión.
•	f. Será obligación del Organizador devolver todos los reembolsos de venta de boletos en un plazo no mayor a 30 días que le fueron entregados para poder hacer efectivo el reembolso correspondiente a la totalidad de asistentes que compraron boletos.
•	g. Man Cave Autographs no se responsabiliza por la falta de liquidez del Organizador del evento para realizar tal devolución de fondos.
•	h. Man Cave Autographs no es responsable de la satisfacción del contenido del evento.
•	i. Man Cave Autographs queda autorizado en este acto por el comprador para proporcionar los datos de contacto con los asistentes y dar seguimiento antes las instancias y las autoridades competentes es caso de que se presente alguna reclamación y/o conflicto de intereses
•	j. El Organizador responderá frente a las autoridades competentes y sacara en paz y a salvo a Man Cave Autographs de las demandas que se pudieran presentar.
•	k. Man Cave Autographs no se hará responsable de que el asistente no pueda asistir al evento en cuestión para el cual compró boletos o en su defecto se haya equivocado en su compra, por lo cual no aplica una devolución o contracargo.
'''
  },
  {
    'header': '12. Contracargos.',
    'paragraph':
        '''De conformidad al Artículo 23 de la Ley para la Transparencia y Ordenamiento de los Servicios Financieros, un Contracargo se genera cuando un tarjetahabiente se pone en contacto directo con su banco para notificar que no reconoce un cargo hecho a su tarjeta de crédito o débito por tu negocio.
                                        
                                        12.1 Responsabilidad del Organizador en Contracargos.

Man Cave Autographs nunca responderá por Contracargos. El Organizador, reconoció y aceptó que responderá por cualquier Contracargo generado en la venta de sus boletos; dicha responsabilidad será de forma ilimitada y subsidiada con el saldo de boletos vendidos que se generé en su cuenta, en el entendido de que, ante la ausencia de saldo suficiente, Man Cave Autographs solicitará al Organizador que restituya el monto correspondiente.
                                        
                                        12.2 Límite De Responsabilidad De Man Cave Autographs.

El Organizador acepta y reconoce que Man Cave Autographs no responderá financiera ni legalmente a cualquier Contracargo ni a la satisfacción del consumidor con el evento. El Organizador será el único responsable y mantendrá a Man Cave Autographs libre de cualquier acción. Man Cave Autographs se compromete a apoyar y defender a los Organizadores que proporcionen la información necesaria para disputar cualquier Contracargo.
                                        
                                        12.3 Resolución

Man Cave Autographs no tiene ningún tipo de autoridad ni participación en caso de Contracargo por lo que debe acatar cualquier resolución emitida por las Autoridades competentes. Man Cave Autographs no se hace responsable por pérdidas ocasionadas al Organizador por fondos no recibidos por concepto de Contracargo.'''
  },
  {
    'header': '13. Impuestos',
    'paragraph':
        '''Todos los impuestos que se generen por el uso de la Plataforma Digital serán cubiertos respectivamente por la Parte que dé pie al hecho generador. Man Cave Autographs, para efectos de estos términos y condiciones, es un intermediario en la relación entre el Organizador y el Comprador por lo que, en el manejo de todos los fondos relativos a pagos efectuados por la compra de boletos, tendrá derecho de retener únicamente la cantidad que le corresponda por pago de comisiones, siendo esta su única contraprestación quedando el Organizador como obligado de pagar los impuestos correspondientes por la cantidad que le sea entregada.'''
  },
  {
    'header': '14. Datos Personales',
    'paragraph':
        '''Los datos proveídos serán tratados de conformidad con la Ley Federal de Protección de Datos Personales en Posesión de los Particulares y su Reglamento, por Man Cave Autographs.
El comprador reconoce que mediante la compra de eventos entrega sus datos a Man Cave Autographs y al Organizador del evento.
Por ello, al aceptar estos términos y condiciones acepta nuestro Aviso de Privacidad.
'''
  },
  {
    'header':
        '15. Código de Conducta para la compra de boletos en la plataforma digital.',
    'paragraph':
        '''El comprador o Usuario acepta que está autorizado a utilizar la Plataforma Digital únicamente para los fines descritos en estos términos y condiciones. El Usuario acepta que es completamente responsable de sus actividades durante el uso de la Plataforma Digital y que se hará cargo de todos los riesgos con respecto al uso de la Plataforma Digital. El Usuario se compromete a no utilizar la Plataforma Digital para participar en cualquier conducta prohibida.
•	i. Queda estrictamente prohibido acosar a cualquier Usuario, mediante spam, mensajes con contenido ofensivo, amenazas, sexismo, discriminación ya sea por cuestión de raza, género, lugar de procedencia.
•	ii. Se prohíbe la difusión de información falsa o personificar o hacerse pasar por una persona distinta a la cual efectúo el registro de Usuario.
•	iii. Se prohíbe cualquier conducta que incite a la violencia física, mental o emocional o a la comisión de algún delito o acto ilícito
'''
  },
  {
    'header': '16. Devoluciones',
    'paragraph':
        '''Para los eventos en los que adquieras boletos para Meet and Greet, no hay devoluciones a menos que el talento al que compraste tu boleto cancele su aparición.'''
  },
  {
    'header': '17. Cancelación de evento',
    'paragraph':
        '''En caso de que el evento para el cual adquiriste alguno de los bienes señalados en la presente sección sea cancelado te será reembolsado el valor nominal de tu compra sin considerar los cargos por servicio y/o comisiones bancarias, que dicha compra haya generado al método de pago con el que realizaste la transacción.
Permisos que nos concedes. Como parte de nuestro acuerdo, también nos concedes los permisos que necesitamos para proporcionarte el Servicio.
No reclamamos la propiedad sobre tu contenido, pero nos concedes una licencia para usarlo.
Nada cambia respecto de tus derechos sobre tu contenido. No reclamamos la propiedad del contenido que publicas en el Servicio o por medio de él. En lugar de ello, cuando compartes, públicas o subes contenido que se encuentra protegido por derechos de propiedad intelectual (como fotos o videos) en nuestro Servicio, o en relación con este, por el presente nos otorgas una licencia internacional, sublicenciable, transferible, libre de regalías y no exclusiva para alojar, usar, distribuir, modificar, administrar, copiar, mostrar o exhibir públicamente y traducir tu contenido, así como para crear trabajos derivados de él (de conformidad con tu configuración de privacidad y de la aplicación).
Aceptas que podemos descargar e instalar actualizaciones del Servicio en tu dispositivo.

Eliminación de contenido e inhabilitación o cancelación de la cuenta cuando el sistema incluya esta modalidad
Podemos eliminar cualquier contenido o información que compartas en el Servicio si consideramos que infringe estas Condiciones de uso o nuestras políticas o si la ley lo exige o nos lo permite. Podemos negarnos a proporcionarte o dejar de proporcionarte la totalidad o una parte del Servicio (incluido cancelar o inhabilitar tu cuenta) inmediatamente para proteger nuestra comunidad o nuestros servicios, o bien si supones para nosotros un riesgo o una exposición legal, infringes estas Condiciones de uso o nuestras políticas.
'''
  },
  {
    'header': '18. Leyes Aplicables y Jurisdicción',
    'paragraph':
        '''El Servicio y la Plataforma Digital se sujetan a las leyes mexicanas en particular al Código Civil Federal. Las Partes sin importar sus domicilios presentes o futuros, por el simple hecho de aceptar estos términos y condiciones aceptan la jurisdicción y competencia de los tribunales de la Ciudad de México.'''
  },
];

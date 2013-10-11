<div class="well well-mini">
<p>Ha sido recepcionado correctamente el  envio de {$envio->usuario->nombre} {$envio->usuario->apellidos}.</p>
<p>Fecha de inicio {$envio->fecha_inicio|date_format:"%d-%m-%Y %H:%M:%S"}{if $envio->fecha_fin != NULL}</p><p>Fecha fín {$envio->fecha_fin|date_format:"%d-%m-%Y %H:%M:%S"} {/if}</p>
<p>Número de envio: {$envio->id}.</p>
<p><a href="javascript:window.print();" class="btn"><i class="icon-print"></i> Imprimir </a> <a href="index.php?page=cuestor" class="btn" ><i class="icon-tasks"></i> Proyectos</a></p>
</div>
<div class="pregunta">
<b>Descripción</b>
					<p>En el I Plan Propio del PAS se señala a la participación como una de las principales vías para la incorporación de las aportaciones de las personas a la estrategia conjunta de la Organización. Para ello, la Dirección de RRHH va a desarrollar una sistemática que permita formalizar los diferentes mecanismos de participación y gestionar adecuadamente sus resultados. El reconocimiento a las personas será el principal estímulo para que todos nos animemos a mostrar nuestros intereses, nuestras preocupaciones y para que nuestra experiencia y profesionalidad tenga el valor que le corresponde.</p>
</div>
<div class="pregunta">
<b>Compromiso</b>
					<p>Manifiesto mi voluntad de participar en los diferentes mecanismos de participación (grupos de trabajo, grupos de discusión, sugerencias, …) que puedan ser de mi interés, ofreciendo así mi experiencia, profesionalidad y conocimientos tanto a la Organización como al resto de compañeros.</p> 
<p style="margin-left:20px">{include file="cuestor/opcion_1.tpl" disabled="true" id_pregunta="1"}</p>
					<p>A continuación, puedes iniciar tu participación respondiendo a una serie de cuestiones planteadas en relación al despliegue del I Plan Propio del PAS. Este primer proyecto consiste en una recopilación de expectativas para ir dando forma a las diversas actuaciones que darán despliegue el I Plan Propio del PAS y para dar por cerrado el diagnóstico de cultura organizacional iniciado en noviembre de 2012, en el que, sustituyendo a las anteriores encuestas de clima, participó más del 90% de la plantilla.</p>
</div>



		<h4>Participación, comunicación y reconocimiento.</h4>
		<p>Conforme al I Plan Propio del PAS, vamos a diseñar un Plan de Comunicación Interna para que las personas de la Administración y Servicios de la US cuenten con toda la información necesaria acerca de nuestra realidad profesional y social y pueda, asimismo, desarrollar una opinión personal propia. Vamos a establecer, además, una sistemática formal que permitirá conocer los mecanismos de participación disponibles, los objetivos asignados a cada cual y las personas que participan en cada uno de ellos. Estos objetivos se verán recompensados en la medida que corresponde, con una sistemática de reconocimiento que anime y motive a las personas a integrarse en una organización moderna al servicio del interés público. Ayúdanos a hacerlo dándonos tu opinión en relación a las siguientes cuestiones:</p>
		<div class="pregunta">
			<h5><span class="">1.1</span> La Dirección de RRHH está activando una sistemática de participación que permitirá a todas las personas incorporar sus ideas, opiniones y, sobre todo, su conocimiento profesional, a los mecanismos de toma de decisión. Valora esta iniciativa de 1 a 6 (1 lo mínimo, 6 lo máximo).</h5>
			<p>{include file="cuestor/opcion_6.tpl" disabled="true" id_pregunta="2"}</p>
		</div>
		<div class="pregunta">
			<h5><span class="">1.2</span> Te parece adecuado que dicha sistemática de participación conlleve un procedimiento de reconocimiento de la participación y que ésta, además, pueda ser valorada como  desempeño y/o mérito profesional?</h5>
			<p>{include file="cuestor/opcion_6.tpl" disabled="true" id_pregunta="3"}</p>
		</div>
		<div class="pregunta">
			<h5><span class="">1.3</span> En los términos que se ha ido señalando en las dos anteriores preguntas, ¿estarías dispuesto a brindar tus conocimientos y tu experiencia profesional a la Organización, participando en los proyectos que despierten tu mayor interés?</h5>
			<p>{include file="cuestor/opcion_6.tpl" disabled="true" id_pregunta="4"}</p>
		</div>
		<div class="pregunta">
		<h5><span class="">1.4</span> Valora de los siguientes proyectos cual es el de mayor interés para tí.</h5>
		<p>{include file="cuestor/q5.tpl" disabled="true" id_pregunta="5"}</p>
		</div>
		<div class="pregunta">
		<h5><span class="">1.5</span> ¿Te parece adecuado que la participación en los diferentes grupos de trabajo formalmente constituidos, tengan en su día y una vez consolidado el funcionamiento de la sistemática de participación, un tratamiento y reconocimiento similar al que actualmente recibe la Formación y la asistencia a cursos?</h5>
		<p>{include file="cuestor/opcion_6.tpl" disabled="true" id_pregunta="7"}</p>
		</div>
		<div class="pregunta">
		<h5><span class="">1.6</span> Valora de 1 a 6 la iniciativa de la Dirección de RRHH de articular una sistemática de comunicación interna para informar veraz, puntual y rigurosamente de aquellos asuntos que más preocupan a las personas.</h5>
		<p>{include file="cuestor/opcion_6.tpl" disabled="true" id_pregunta="8"}</p>
		</div>
		<div class="pregunta">
		<h5><span class="">1.7</span> ¿Te inclinarías por un CANAL INSTITUCIONAL a la hora de informarte de asuntos que afectan a la vida profesional y laboral de las personas de la Administración y Servicios de la US?</h5>
		<p>{include file="cuestor/opcion_6.tpl" disabled="true" id_pregunta="10"}</p>
		</div>
		<div class="pregunta">
		<h5><span class="">1.8</span> De los siguientes campos de información (objeto del próximo plan de Comunicacion Interna previsto). ¿Cúal sería el de tu mayor interés?</h5>
		<p>{include file="cuestor/q11.tpl" disabled="true" id_pregunta="11"}</p>
		</div>
		<h4>Carácter plurianual</h4>
<p>Vamos a llevar a la práctica real el uso de planes de mejora, paneles de indicadores y sistemáticas para el seguimiento de actuaciones. La planificación cuidadosa de cada actuación permite no solo conocer al detalle el estado de cada situación, sino que además facilita la toma de decisiones que permiten corregir desviaciones, lo cual hace de la planificación estructurada una herramienta de gestión que facilita enormemente el logro de objetivos. Pero para que todo funcione, es fundamental que se realice una planificación conjunta y coordinada, desde los planes estratégicos de la Universidad de Sevilla o el Programa del Rector, hasta los planes operativos del servicio o la unidad más pequeños de toda nuestra estructura.</p>

<div class="pregunta">
<h5><span class="">2.1</span> ¿Te parece adecuado que la dirección de RRHH muestre una planificación plurianual de todas las actuaciones estratégicas y relacionadas con el desempeño de sus funciones?</h5>
<p>{include file="cuestor/opcion_6.tpl" disabled="true" id_pregunta="12"}</p>
</div>
<div class="pregunta">
<h5><span class="">2.2</span> Te parece adecuada la información disponible actualmente en relación a la planificación de RRHH y a las actuaciones vinculadas (seguimiento ACPMCS, evaluación del desempeño, etc…)?</h5>
<p>{include file="cuestor/opcion_6.tpl" disabled="true" id_pregunta="13"}</p>
</div>
<div class="pregunta">
<h5><span class="">2.3</span> La intención de la Dirección de RRHH de mostrar sus planes de trabajo deberá ser tomada como un ejemplo a seguir por todas las unidades. En relación a la tuya, ¿crees que ya hace algo parecido, mostrando públicamente sus objetivos y las actuaciones desplegadas para lograrlos?</h5>
<p>{include file="cuestor/opcion_6.tpl" disabled="true" id_pregunta="14"}</p>
</div>
<h4>Ordenación de puestos de trabajo / Nuevas fórmulas de gestión</h4>
<p>El I Plan Propio del Pas contempla una reordenación de puestos de trabajo que permita una ágil aplicación de las nuevas fórmulas de gestión que introduce el EBEP y que facilite la identificación de las aportaciones de cada persona desde su puesto de trabajo y su impacto en el logro de los objetivos institucionales. Se pretende, con ello, lo mejor para la sostenibilidad de la Organización generando, al mismo tiempo, el mejor entorno posible de trabajo y el más seguro para todos.</p>

<div class="pregunta">
<h5><span class="">3.1</span> Señala el parámetro que,  según tu opinión, más debería puntuar en una provisión de puestos de trabajo.</h5>
<p>{include file="cuestor/q47.tpl" disabled="true" id_pregunta="47"}</p>
</div>
<div class="pregunta">
<h5><span class="">3.2</span> Conforme al Test de Cultura del pasado mes de noviembre, solo un 14% de nuestra plantilla conoce totalmente los servicios en los que realmente impacta su trabajo. ¿Con qué grado de prioridad, de 1 a 6, te parece necesario que la Dirección de RRHH incorpore la corrección de esta situación en la definición de puestos de trabajo que está acometiendo? </h5>
<p>{include file="cuestor/opcion_6.tpl" disabled="true" id_pregunta="15"}</p>
</div>
<div class="pregunta">
<h5><span class="">3.3</span> La Dirección de RRHH quiere cambiar el dato que dice que solo un 15% de nosotros se identifica con los logros de la Universidad de Sevilla como Institución. ¿Quién crees que tiene la mayor responsabilidad para modificar este dato?</h5>
<p>{include file="cuestor/otro_4.tpl" disabled="true" id_pregunta="16"}</p>
</div>
<div class="pregunta">
<h5><span class="">3.4</span> ¿Crees que la actual  relación de puestos de trabajo se configura aplicando suficientes criterios objetivos en su definición?.</h5>
<p>{include file="cuestor/opcion_6.tpl" disabled="true" id_pregunta="17"}</p>
</div>
<div class="pregunta">
<h5><span class="">3.5</span> En el Test de Cultura mencionado, menos del 5% de los que han respondido reconoció  el máximo grado de flexibilidad, en la Universidad de Sevilla, para responder con solvencia a los cambios impuestos por el entorno. La Dirección de RRHH se dispone a reconducir esta situación, sabiendo que la flexibilidad puede reportar beneficios tanto a la organización como a las personas, pero, ¿hasta qué punto estás dispuesto a ofrecer tu colaboración?</h5>
<p>{include file="cuestor/opcion_6.tpl" disabled="true" id_pregunta="19"}</p>
</div>
<div class="pregunta">
<h5><span class="">3.6</span> Teniendo encuenta que la valoración de puestos de trabajo repercute en el salario de la persona que ha de ocupar dicho puesto. Señala el parámetro que consideras más oportuno para valorar puestos de trabajo.</h5>
<p>{include file="cuestor/q48.tpl" disabled="true" id_pregunta="48"}</p>
</div>
<h4>Formación y Acción Social</h4>
<p>Se trata de dos capítulos fundamentales para una gestión de los RRHH coherente con las personas, con sus necesidades y con el necesario bienestar que debe reinar en el ambiente de trabajo. Por ello, nos interesa tu opinión en relación a los compromisos recogidos en el I Plan Propio del PAS.</p>
<div class="pregunta">
<h5><span class="">5.1</span> Una de las grandes ventajas competitivas de las organizaciones modernas se encuentra en la polivalencia de su personal. ¿Estarías dispuesto a colaborar en una espiral de acciones formativas en la que todos pudiesen aprender de todos (conllevaría ser, en ocasiones profesor, en ocasiones alumno)? Para esto sirven todas las personas, ya que todos tenemos algo que enseñar al resto.</h5>
<p>{include file="cuestor/opcion_6.tpl" disabled="true" id_pregunta="21"}</p>
</div>
<div class="pregunta">
<h5><span class="">5.2</span> ¿Te parece adecuado el nivel de información con el que hasta ahora ha venido siendo ejecutado el Plan Global de Acción Social?</h5>
<p>{include file="cuestor/opcion_6.tpl" disabled="true" id_pregunta="22"}</p>
</div>
<div class="pregunta">
<h5><span class="">5.3</span> La dirección de RRHH se ha comprometido a presentar anualmente un Plan de Acción Social. Selecciona el aspecto más importantes que crees que debe considerar dicho plan:</h5>
<p>{include file="cuestor/q23.tpl" disabled="true" id_pregunta="23"}</p>
</div>
<h4>Cuadro de mando de RRHH</h4>
<p>La implantación de un verdadero cuadro de mando de RRHH, que permita aplicar un enfoque preventivo en la toma de decisiones y facilite la incorporación de la Administración y Servicios a la Estrategia Institucional en los términos descritos en el I Plan Propio del PAS, requiere de una adecuada gestión de la cultura organizacional y, muy especialmente, del liderazgo. Porque, efectivamente, las personas son el motor de las organizaciones, y los responsables de equipos constituyen la cadena de transmisión entra la Organización y las personas que la conforman.</p>

<div class="pregunta">
<h5><span class="">6.1</span> En al Test de Cultura Organizacional que se inició el pasado mes de noviembre, apenas un 9% reconoció el mayor grado posible la utilidad de los actuales procedimientos de la US, ¿de quién crees que es esta responsabilidad?</h5>
<p class="opcion_otro"> {include file="cuestor/q24.tpl" disabled="true" id_pregunta="24"} </p>
</div>
<div class="pregunta">
<h5><span class="">6.2</span> Valora a tu superior directo como líder (la Universidad de Sevilla quiere lideres motivadores, que aporten experiencia y conocimiento, que eviten el conflicto y refuercen las capacidades de los miembros de su equipo y que, en definitiva, sean reconocidos por un comportamiento ejemplar).</h5>
<p class="opcion_otro"> {include file="cuestor/opcion_6.tpl" disabled="true" id_pregunta="25"} </p>
</div>
<div class="pregunta">
<h5><span class="">6.3</span> Conforme al test de cultura organizacional de noviembre pasado, es necesario definir el estilo de liderazgo US,   ¿Crees que dicha definición explícita ayudaría a los líderes en el desempeño de su trabajo, de modo que se pudiese valorar objetivamente su actitud como líder?</h5>
<p class="opcion_otro"> {include file="cuestor/opcion_6.tpl" disabled="true" id_pregunta="26"} </p>
</div>
<div class="pregunta">
<h5><span class="">6.4</span> Si las personas son el motor de la Organización, los líderes son motor de las personas y la Dirección RRHH, en particular, constituye el motor principal, liderando los procesos de cambio, adaptación y estandarización en el trato a todas las personas. Valora de 1 a 6 (1 lo mínimo, 6 lo máximo) el papel de la actual Dirección de RRHH en el desempeño de este papel institucional.</h5>
<p class="opcion_otro"> {include file="cuestor/opcion_6.tpl" disabled="true" id_pregunta="27"} </p>
</div>
<div class="pregunta">
<h5><span class="">6.5</span> El papel de la Dirección de RRHH, como motor último de la Administración y Servicios de la US, debe ser secundado por los responsables de las diferentes unidades, ¿crees que estos responsables también deben mejorar su desempeño en la coordinación y liderazgo de equipos de trabajo?</h5>
<p class="opcion_otro"> {include file="cuestor/opcion_6.tpl" disabled="true" id_pregunta="29"} </p>
</div>
<div class="pregunta">
<h5><span class="">6.6</span> Una organización es flexible cuando lo son su personal y sus responsables. Valora, en este caso, el nivel de flexibilidad (adaptación rápida a nuevas necesidades y resolución ágil de imprevistos) de tu superior directo</h5>
<p class="opcion_otro"> {include file="cuestor/opcion_6.tpl" disabled="true" id_pregunta="30"} </p>
</div>
<div class="pregunta">
<h5><span class="">6.7</span> La implantación del cuadro de Mando de RRHH que se señala en el I Plan Propio del PAS permitirá argumentar técnicamente las decisiones en materia de planificación de RRHH. Valora, de 1 a 6, esta iniciativa de la Dirección de RRHH.</h5>
<p class="opcion_otro"> {include file="cuestor/opcion_6.tpl" disabled="true" id_pregunta="31"} </p>
</div>
<h4>Aportación personal, Información general y I Plan Propio PAS</h4>
<p>En este último apartado podrás seguir expresando tu opinión  y aportar alguna información adicional sólo con fines estadísticos.</p><p>Finalmente podrás realizar un comentario libre para lo cual te recordamos el uso anónimo de toda la información facilitada.</p>
<div class="pregunta">
<h5><span class="">7.1</span> La Dirección de RRHH ha elaborado un Plan Propio para el PAS que, dando respuesta al Programa del Rector, trata de dar al PAS el lugar que le corresponde en la Institución. El objetivo de la Dirección de RRHH es que todas las personas se sientan identificadas con este Plan, ¿hasta qué punto te identificas tú?</h5>
<p class="opcion_otro"> {include file="cuestor/opcion_6.tpl" disabled="true" id_pregunta="32"} </p>
</div>
<div class="pregunta">
<h5><span class="">7.2</span> Hasta que punto te identificas con el proyecto de la actual Dirección de Recursos Humanos.</h5>
<p class="opcion_otro"> {include file="cuestor/opcion_6.tpl" disabled="true" id_pregunta="34"} </p>
</div>
<div class="pregunta">
<h5><span class="">7.3</span> Hasta que punto conoces la figura del Delegado del Rector para el PAS.</h5>
<p class="opcion_otro"> {include file="cuestor/opcion_6.tpl" disabled="true" id_pregunta="36"} </p>
</div>
<div class="pregunta">
<h5><span class="">7.4</span> Señala el tiempo total desde el que eres Empleado
Público de la Universidad de Sevilla</h5>
<p class="opcion_otro"> {include file="cuestor/tiempo.tpl" disabled="true" id_pregunta="40"} </p>
</div>
<div class="pregunta">
<h5><span class="">7.5</span> Señala el tiempo que llevas desempeñando tu actual puesto de trabajo</h5>
<p class="opcion_otro"> {include file="cuestor/tiempo.tpl" disabled="true" id_pregunta="41"} </p>
</div>
<div class="pregunta">
<h5><span class="">7.6</span> Señala la descripción más aproximada de tu actual  puesto de trabajo</h5>
<p class="opcion_otro"> {include file="cuestor/q42.tpl" disabled="true" id_pregunta="42"} </p>
</div>
<div class="pregunta">
<h5><span class="">7.7</span> Señala tu Plaza como Empleado Público de la Universidad de Sevilla</h5>
<p class="opcion_otro"> {include file="cuestor/q43.tpl" disabled="true" id_pregunta="43"} </p>
</div>
<div class="pregunta">
<h5><span class="">7.8</span> En qué aspecto de la Administración y Servicios de la Universidad de Sevilla crees que impacta mayoritariamente tu trabajo cotidiano (señala solo una de ellas)</h5>
<p class="opcion_otro"> {include file="cuestor/q44.tpl" disabled="true" id_pregunta="44"} </p>
</div>
<div class="pregunta">
<h5><span class="">7.9</span> Puede escribir comentarios en relación al I Plan Propio de RRHH y que usted considere que no han sido tratado en el mismo o en este Proyecto</h5>
<p class="opcion_otro"> {include file="cuestor/comentarios.tpl" disabled="true" id_pregunta="45"} </p>
</div>




<p style="margin-top:10px"><a href="javascript:window.print();" class="btn"><i class="icon-print"></i> Imprimir </a> <a href="index.php?page=cuestor" class="btn" ><i class="icon-tasks"></i> Proyectos</a></p>
{literal}
<style>
.pregunta{
border:1px solid #e9e9e9;
margin-top:10px;
padding:15px;
}
</style>
{/literal}

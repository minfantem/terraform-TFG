# Objeto

Este documento tiene como finalidad presentar el desarrollo y los hallazgos del proyecto de fin de grado (TFG), que es diseñar y desplegar una infraestructura en la nube utilizando Terraform, con un enfoque especial en la creación de una VPN automatizada.


# Ámbito

Este TFG se realiza como parte de los requisitos para la obtención del título de grado en el Centro de Estudios Superiores Afuera, correspondiente al año académico 2023-2024. El proyecto refleja una investigación independiente y el culmen de la formación académica, demostrando la capacidad de aplicar y sintetizar los conocimientos adquiridos en un proyecto práctico y autónomo. 


# Glosario de términos y acrónimos 

| Sigla | Significado |
|--|--|
| ASIR |  Administración de Sistemas Informáticos en Red |
| TFG |  Trabajo de Fin de Grado |
| IaC |  Infrastructure as Code. Práctica de gestionar y aprovisionar infraestructura de TI a través de archivos de configuración en lugar de configuración manual |
| DevOps | Conjunto de prácticas, herramientas y filosofía cultural que sirve para automatizar e integrar los procesos que comparten el equipo de desarrollo de software y el de TI |
| IAM |   Identity and Access Management. Servicio de gestión de identidades y accesos de AWS |
| AWS |  Amazon Web Services. Plataforma de servicios en la nube ofrecida por Amazon | 
| VPC |  Virtual Private Cloud. Red virtual aislada en la nube de AWS | 
| EC2 |  Elastic Compute Cloud. Servicio de instancias virtuales escalables en la nube de AWS |
| EBS |  Elastic Block Store. Servicio de almacenamiento de bloques en la nube de AWS|
| S3 |  Simple Storage Service. Servicio de almacenamiento de objetos en la nube de AWS |
| ACL |  Access Control List. Lista de control de acceso que define permisos en la nube de AWS |
| VPN |  Virtual Private Network. Establece una conexión segura entre dispositivos remotos |
| CPU |  Central Processing Unit. Unidad de procesamiento central en un ordenador |
| GPU |  Graphics Processing Unit. Unidad de procesamiento gráfico en un ordenador|
| GUI |  Graphical User Interface. Interfaz de usuario gráfica |
| API |  Application Programming Interface. Interfaz de programación de aplicaciones que permite la comunicación entre diferentes componentes de software |



# Abstract

In the contemporary digital landscape, the evolution of technology has rendered cybersecurity a critical concern. With the exponential growth in cyber threats, particularly targeted at businesses for economic and political motives, safeguarding systems and networks has become paramount. The accumulation of vast amounts of data now equates to significant power, driving a surge in cyberattacks.

This project embarks on an exploration of cloud infrastructure deployment using Terraform, with a keen emphasis on the AWS provider. As enterprises transition towards cloud-based architectures, a myriad of considerations emerges, spanning from resource allocation to the implementation of robust security protocols.

A comprehensive analysis of best practices for deploying cloud infrastructures efficiently and securely using Terraform is undertaken. This encompasses the configuration of virtual networks, management of instances, storage provisioning, and the enforcement of stringent security measures.

Furthermore, the primary aim of this endeavor is to engineer a bespoke, fully automated personal VPN solution leveraging Terraform. Tailored to cater to both personal and enterprise needs, this VPN promises to furnish a secure conduit for the transmission of sensitive data, underpinned by the principles of automation and scalability.

__Keywords:__ cloud deployment, infrastructure as code, Terraform, AWS, automation, security, scalability, resource management, personal VPN.


# Resumen

En la era actual, el despliegue de infraestructuras en la nube se ha convertido en un elemento crítico para empresas de todos los tamaños. El aumento en la demanda de escalabilidad, disponibilidad y seguridad ha llevado a una adopción masiva de soluciones como Terraform, especialmente en el entorno de proveedores líderes como AWS.

Este proyecto se enfoca en explorar las complejidades y desafíos del despliegue de infraestructuras en la nube utilizando Terraform, con especial énfasis en el proveedor AWS. La migración hacia entornos basados en la nube plantea una serie de consideraciones únicas, desde la gestión de recursos hasta la seguridad y el rendimiento.

Se analizarán detalladamente las prácticas recomendadas para la implementación eficiente y segura de infraestructuras en la nube con Terraform. Esto incluirá la configuración de redes virtuales, la gestión de instancias, el almacenamiento de datos y la aplicación de políticas de seguridad robustas.

Además, como objetivo final, se trabajará en la creación de una VPN completamente automatizada, diseñada y mantenida por nosotros, con Terraform. Esta VPN podrá ser utilizada tanto para fines privados como empresariales, proporcionando un canal seguro y confiable para la transmisión de datos sensibles.

__Palabras clave:__ despliegue en la nube, infraestructura como código, Terraform, AWS, automatización, seguridad, escalabilidad, gestión de recursos, VPN.


# Herramientas necesarias

Para el despliegue de infraestructuras con Terraform, he elegido Linux como mi entorno de desarrollo principal. Esta decisión no es casualidad; Linux se alinea perfectamente con los principios de eficiencia, estabilidad y seguridad que son fundamentales en el mundo del desarrollo de software.

Linux me brinda una plataforma sólida y confiable, ideal para manejar las complejidades de la infraestructura como código. Su naturaleza de código abierto me permite personalizar mi entorno de desarrollo a medida que avanzo en mi proyecto TFG. Además, la amplia comunidad de Linux ofrece un soporte inigualable, lo que me asegura que siempre tendré acceso a las últimas herramientas y mejores prácticas.

En este entorno, Terraform se convierte en una herramienta poderosa, permitiéndome definir de manera declarativa la infraestructura necesaria para mis aplicaciones y servicios. La integración con AWS a través de la línea de comandos es fluida, y la capacidad de versionar mi código con Git complementa mi flujo de trabajo, asegurando que cada cambio esté documentado y sea reproducible.

En los siguientes capítulos, detallaré cómo la combinación de Terraform y Linux se convierte en un dúo dinámico para el despliegue eficiente y seguro de infraestructuras en la nube, demostrando por qué esta combinación es la elección preferida para desarrolladores y empresas por igual.


## Terraform
Como parte esencial de mi proyecto, **Terraform** se ha convertido en una herramienta indispensable en mi arsenal para la creación y gestión de infraestructura como código (IaC). Me permite definir y desplegar servicios en la nube de manera eficiente y predecible, utilizando su lenguaje de configuración propio, **HashiCorp Configuration Language (HCL)**.

- **HCL (HashiCorp Configuration Language)**: A través de HCL, Terraform me facilita describir la infraestructura que necesito. Este lenguaje declarativo me permite expresar mis intenciones de infraestructura de forma clara, sin tener que sumergirme en los detalles de implementación. Sus características clave son:

    - **Legibilidad humana**: HCL está diseñado para ser fácilmente legible por humanos. Su sintaxis se asemeja al formato de archivos de configuración comunes, lo que facilita la colaboración y la revisión de código.
    - **Expresividad**: Con HCL, puedo definir variables, módulos, funciones y bloques de datos, lo que me permite crear una infraestructura modular y reutilizable.
    - **Idempotencia**: Una de las grandes ventajas de Terraform es que solo aplica los cambios necesarios para alcanzar el estado deseado, permitiéndome ejecutar el mismo conjunto de configuraciones sin preocuparme por efectos secundarios no deseados.

- **Instalación y configuración**:
  Terraform es una herramienta de código abierto, por lo que puedes descargarla directamente desde el sitio web oficial de Terraform. La instalación varía según el sistema operativo:

  - **Windows**: Puedes descargar el ejecutable y añadirlo al PATH de tu sistema o utilizar un gestor de paquetes como Chocolatey.
  - **macOS**: Terraform está disponible a través de Homebrew. Puedes instalarlo con el comando _brew install terraform_.
  - **Linux**: Puedes descargar el paquete binario y extraerlo en una ubicación que esté en tu PATH.

  Una vez instalado, puedes verificar la instalación con el comando _terraform -v_, que te mostrará la versión actual de Terraform instalada.


## AWS CLI
La **Interfaz de Línea de Comandos de AWS (AWS CLI)** es otra herramienta esencial que uso para la gestión de servicios de AWS directamente desde mi terminal. Esto me permite automatizar tareas mediante scripts.

- **Instalación y configuración**: La instalación de la AWS CLI en mi sistema Linux es sencilla. Utilizo el siguiente bloque de comandos para instalarla:
   ```bash
   curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
   unzip awscliv2.zip
   sudo ./aws/install
   ```
    Luego configuro mis credenciales de AWS con el comando _aws configure_.Es necesario generar el _"access key"_ y el _"secret access key"_ con el usuario IAM creado en la sección de _Security credentials_. Recomiendo encarecidamente hacer clic en _"Descargar archivo .csv"_.  

- **Comandos básicos**: Algunos comandos útiles de la AWS CLI incluyen:

    - _**aws ec2 describe-instances**_: Muestra información sobre las instancias EC2 en tu cuenta.
    - _**aws s3 ls**_: Lista los buckets de Amazon S3.
    - _**aws rds describe-db-instances**_: Obtiene detalles sobre las instancias de bases de datos RDS.

## VSCode
**Visual Studio Code (VSCode)** es un editor de código fuente desarrollado por Microsoft. Es mi editor de código fuente preferido. Su naturaleza gratuita y de código abierto, junto con su amplia gama de extensiones, lo hacen ideal para trabajar con Terraform y otros lenguajes de programación.

- **Extensiones para Terraform**: He mejorado mi experiencia de desarrollo instalando extensiones específicas para Terraform en VSCode, como la extensión de Terraform que proporciona resaltado de sintaxis y autocompletado.

- **Integración con Git**: La integración nativa de VSCode con Git me facilita la gestión de versiones de mis archivos de configuración de Terraform, permitiéndome realizar confirmaciones y ramificaciones directamente desde el editor.


# Instrucciones de uso 

Como estudiante de ASIR y creador de este proyecto TFG, he compilado una guía que no solo facilitará el uso y la gestión de la VPN configurada con OpenVPN, sino que también servirá como documento de referencia para cualquier persona que acceda a este repositorio.

Este repositorio de GitHub ha sido diseñado para ser un punto de acceso fácil a los scripts necesarios para el proyecto y, al mismo tiempo, un espacio de trabajo futuro para colaborar en este proyecto o en cualquier otro que pueda surgir.

## Configuración inicial

Antes de comenzar, es fundamental establecer un entorno de trabajo adecuado:

1. **Instalación de Terraform**
   Para instalar Terraform, sigue estos pasos:
   - Visita la página oficial de [Terraform](https://www.terraform.io/).
   - Descarga la versión adecuada para tu sistema operativo.
   - Descomprime el archivo descargado y coloca el ejecutable de Terraform en una carpeta incluida en tu variable de entorno **PATH**.
   - Abre una terminal y escribe _**terraform**_ para verificar que la instalación fue exitosa.

1. **Clonar el repositorio**
   Clonar el repositorio es un proceso sencillo:
   - Asegúrate de tener **git** instalado en tu sistema.
   - Navega a la página de GitHub del repositorio que deseas clonar.
   - Busca el botón **Clone or download** y copia la URL proporcionada.
   - Abre una terminal, navega al directorio donde deseas clonar el repositorio y ejecuta _**git clone [URL del repositorio]**_.
   - Una vez clonado, tendrás una copia local de todos los scripts y archivos del repositorio.

1. **Credenciales de AWS**
   Configurar tus credenciales de AWS es crucial para la seguridad y el acceso:
   - Crea un usuario IAM en tu cuenta de [AWS](https://aws.amazon.com/es/console/) con los permisos necesarios para gestionar los recursos que Terraform desplegará.
   - Descarga las claves de acceso (Access Key ID y Secret Access Key) y guárdalas en un lugar seguro.
   - Configura tus credenciales utilizando el comando **aws configure** si tienes AWS CLI instalado, o bien, establece las variables de entorno **AWS_ACCESS_KEY_ID** y **AWS_SECRET_ACCESS_KEY**.
   - Terraform utilizará estas credenciales para crear y gestionar recursos en tu cuenta de AWS.


## Despliegue de recursos

Con el entorno ya configurado, es hora de proceder con el despliegue de la infraestructura. El proceso se divide en tres etapas principales: inicialización, planificación y aplicación.

### 1. Inicialización de Terraform

Antes de poder aplicar cualquier cambio, es necesario preparar el directorio de trabajo de Terraform:

```bash
cd /ruta/al/directorio/clonado
terraform init
```

Este comando realiza varias acciones importantes:
- **Prepara los proveedores**: Instala y configura los proveedores requeridos, en nuestro caso, AWS.
- **Verifica la configuración**: Asegura que todos los archivos de configuración sean válidos (*terraform validate*).





Si todo está correcto, verás un mensaje de éxito. De lo contrario, Terraform te informará sobre cualquier error encontrado, lo que te permitirá realizar las correcciones necesarias antes de proceder.

### 2. Planificación

El siguiente paso es generar y revisar un plan de ejecución:

```bash
terraform plan
```

Este comando es crucial porque:
- **Muestra los Cambios**: Te permite ver exactamente qué recursos se crearán, modificarán o destruirán.
- **Detecta Configuraciones Adicionales**: A veces, Terraform identifica configuraciones implícitas que no están explícitamente definidas en tus archivos pero son necesarias para el correcto funcionamiento de la infraestructura.
- **Permite la Revisión**: Puedes revisar y confirmar que todos los cambios propuestos son los deseados antes de aplicarlos.


### 3. Aplicación

Finalmente, aplicamos la configuración para materializar nuestra infraestructura:

```bash
terraform apply
```

Al ejecutar este comando:
- **Se ejecuta un plan**: Terraform realiza automáticamente un **terraform plan** y te muestra los cambios propuestos.
- **Se solicita confirmación**: Antes de proceder, se te pedirá que confirmes que deseas aplicar los cambios.
- **Se crea la infraestructura**: Una vez confirmado, Terraform comienza a crear los recursos en AWS. Si surge algún problema, como falta de permisos, Terraform detendrá el proceso y revertirá cualquier cambio parcial, informándote del error para que puedas solucionarlo.

Una vez completado el proceso, podrás acceder al panel web de AWS y ver la infraestructura recién creada y funcionando.


### _Nota importante sobre el uso de --auto-approve_

Cuando ejecutas el comando **terraform apply**, Terraform solicita una confirmación antes de proceder con la creación de recursos. Esto sirve como un paso de verificación para asegurarte de que todos los cambios que se van a aplicar son correctos y deseados.

Es posible automatizar este paso de confirmación utilizando el flag **--auto-approve**:

```bash
terraform apply --auto-approve
```

Sin embargo, es importante destacar que **no se recomienda** el uso de este flag durante la creación de recursos, especialmente en entornos de producción o cuando se trabaja con infraestructuras críticas. Las razones son claras:

- **Revisión de cambios**: Es una buena práctica revisar los cambios propuestos por Terraform para evitar sorpresas o errores no detectados.
- **Control de costos**: Algunos recursos pueden incurrir en costos adicionales. Confirmar manualmente te da la oportunidad de revisar y asegurarte de que estás de acuerdo con estos gastos antes de que se realicen.
- **Seguridad**: Evita la creación accidental de recursos que podrían exponer tu infraestructura a riesgos de seguridad.

En resumen, aunque el flag **--auto-approve** puede ser útil en ciertos escenarios automatizados o de desarrollo, siempre es más seguro realizar una última revisión manual antes de aplicar cambios significativos en tu infraestructura.




## Inputs y outputs


### Personalización de parámetros en Terraform

En Terraform, la ejecución de los comandos _terraform plan_ o _terraform apply_ no requiere la introducción manual de parámetros si ya están predefinidos. Sin embargo, si deseas personalizar la configuración para adaptarla a tus necesidades específicas, puedes hacerlo de manera sencilla:

1. **Modificación de parámetros con terraform.tfvars**:
   - Localiza el archivo _terraform.tfvars_ en el directorio raíz de tu proyecto.
   - Edita las variables que desees cambiar, asignándoles los valores que requieras.

   - Guarda el archivo y ejecuta _terraform plan_ o _terraform apply_ para ver los cambios reflejados.

2. **Alteración de valores predeterminados en variables.tf**:
   - Si necesitas hacer cambios más permanentes o estructurales, puedes modificar directamente el archivo _variables.tf_.
   - Cambia los valores predeterminados (_default_) de las variables que quieras ajustar.

   - Estos cambios afectarán a todas las futuras ejecuciones de Terraform, a menos que se especifiquen otros valores en _terraform.tfvars_.




### Inputs

| Name                                        | Description                                                                 | Type   | Required |
|---------------------------------------------|-----------------------------------------------------------------------------|--------|----------|
| **aws_region**                              | La región de AWS a utilizar                                                 | String | Sí       |
| **shared_credentials_files**                | La ubicación del archivo de credenciales compartidas de AWS                 | String | No       |
| **profile**                                 | El perfil a utilizar                                                        | String | No       |
| **tag_name**                                | El nombre para etiquetar los recursos de AWS                                | String | Sí       |
| **cidr_block**                              | El rango de bloque CIDR a utilizar para la VPC de OpenVPN                    | String | No       |
| **ami**                                     | La AMI a utilizar                                                           | String | No       |
| **instance_type**                           | El tipo de instancia a utilizar                                              | String | Sí       |
| **instance_root_block_device_volume_size**  | El tamaño del volumen del dispositivo de bloque raíz de la instancia EC2    | Number | No       |
| **ec2_username**                            | El usuario para conectarse a la instancia EC2                                | String | No       |
| **ssh_public_key_file**                     | La clave pública SSH para almacenar en la instancia EC2                      | String | No       |
| **ssh_private_key_file**                    | La clave privada SSH utilizada para conectar a la instancia EC2              | String | No       |
| **ovpn_users**                              | La lista de usuarios para provisionar automáticamente con acceso a OpenVPN   | List   | Sí       |
| **ovpn_config_directory**                   | El nombre del directorio para eventualmente descargar los archivos de configuración OVPN | String | No       |
| **openvpn_install_script_location**         | La ubicación del script de instalación de OpenVPN                             | String | No       |



### Outputs

| Name               | Description                                                                                     |
|--------------------|-------------------------------------------------------------------------------------------------|
| **ec2_instance_dns** | El DNS público de la instancia EC2 asociada a la dirección IP elástica de OpenVPN.              |
| **ec2_instance_ip**  | La dirección IP pública de la instancia EC2 asociada a la dirección IP elástica de OpenVPN.     |
| **connection_string**| La cadena de conexión para SSH que utiliza la clave privada SSH y el usuario de la instancia EC2.|
| **ec2_instance_id**  | El identificador único de la instancia EC2 de OpenVPN.                                          |




## Prueba de conectividad VPN

### Instrucciones para Linux

Si OpenVPN no está presente en tu sistema Ubuntu, puedes instalarlo ejecutando:

```bash
sudo apt-get update
sudo apt-get install openvpn
```

Si es necesario, inicia el servicio de OpenVPN con:
```bash
sudo service openvpn start
```

Una vez hayas realizado un **terraform apply** y la infraestructura desplegada este funcionando en el mismo directorio clonado tendrás nuevos archivos en la ubicación "generated/ovpn-config", puedes probar la conexión iniciando la conexión de OpenVPN con el comando:

```bash
sudo openvpn --config generated/ovpn-config/<archivo.ovpn>
```

### Instrucciones para dispositivos móviles


Para Android:

1. **Instalación de la app**: Busca e instala "OpenVPN Connect" desde Google Play Store.
1. **Descarga de archivos**: Obtén el archivo .ovpn de la carpeta *"generated/ovpn-config"*.
1. **Importación y configuración**: Permite el acceso a datos, navega a la carpeta "Descargas", elige e importa los archivos de configuración.
1. **Conexión VPN**: Añade un título, activa el interruptor y acepta los permisos necesarios para conectar.

Para iPhone/iPad:

1. **Instalación de la app**: Descarga e instala "OpenVPN Connect" desde la App Store.
1. **Descarga de archivos**: Obtén el archivo .ovpn de la carpeta *"generated/ovpn-config"*.
1. **Importación y configuración**: Abre el archivo con OpenVPN Connect y añade el perfil.
1. **Conexión VPN**: Permite que OpenVPN se añada a tus configuraciones de VPN y conéctate.


## Eliminación de la infraestructura


Soy consciente de que AWS cobra por el uso de sus servicios. Por ello, mantener una infraestructura activa de forma permanente cuando no es necesaria puede resultar costoso. 

### Desactivación manual en AWS

Eliminar manualmente los recursos desde la consola de AWS puede ser un proceso tedioso y propenso a errores, ya que muchos servicios y configuraciones están interconectados. Además, existe el riesgo de pasar por alto algunos servicios activos que continuarían generando costos si no se eliminan adecuadamente.

### Automatización con Terraform

Para facilitar este proceso, Terraform ofrece una solución eficiente a través del comando:

```bash
terraform destroy
```

Este comando permite eliminar de manera automática y ordenada todos los recursos que hemos creado, reduciendo significativamente los costos durante el desarrollo. Con un par de comandos, podemos levantar la infraestructura para pruebas y luego desmontarla para evitar gastos innecesarios.

**Nota**: Al igual que apply también es posible automatizar el paso de confirmación utilizando el flag **--auto-approve**.

### Consideraciones importantes

- **Tiempo de proceso**: Tanto la creación como la eliminación de la infraestructura llevan tiempo, lo cual debe ser considerado en la planificación del proyecto.
- **Costos de creación**: AWS cobra por la creación de ciertos recursos, como los clusters, por lo que no es recomendable estar creando y eliminando recursos constantemente sin una buena razón.

### Consejos prácticos

Es crucial encontrar un equilibrio entre el uso y la eliminación de recursos. Si sabes que no vas a utilizar la infraestructura en los próximos días, es recomendable desactivarla. Sin embargo, si la vas a necesitar en breve, podría ser más económico mantenerla activa, ya que el costo de recrearla puede ser similar al de su mantenimiento.




## Control de instancias EC2 mediante scripting 

Como el creador de este proyecto, he implementado un script llamado _"start_stop_ec2.sh"_ que ofrece una gran ventaja en la gestión de costos de AWS, ya que permite apagar o encender la instancia EC2 según sea necesario. Esto es especialmente útil porque la instancia EC2 es el componente que genera costos reales dentro de nuestra infraestructura.

### Uso del script _start_stop_EC2_

El script proporciona un menú interactivo que facilita el control de la instancia EC2. Aquí está el proceso detallado:

1. **Detener la instancia**: Si necesitas detener la instancia para evitar cargos innecesarios, el script ejecutará la función _stop_instance_, que detendrá la instancia especificada.

2. **Iniciar la instancia**: Cuando estés listo para trabajar nuevamente, el script ejecutará la función _start_instance_, que iniciará la instancia previamente detenida.


### Ventajas

- **Control de costos**: Solo pagas por lo que usas. Al detener la instancia cuando no está en uso, reduces los costos operativos.
- **Facilidad de uso**: El menú interactivo simplifica el proceso de controlar el estado de la instancia EC2 sin tener que navegar por la consola de AWS.
- **Automatización**: Con este script, puedes automatizar el proceso de encendido y apagado, integrándolo en tus flujos de trabajo de desarrollo o producción.



   Revisamos en la consola web de AWS que la instancia cambia de estado y se está deteniendo. Recuerda que para ejecutar este script necesitarás tener configuradas tus credenciales de [AWS CLI](#42-aws-cli) y permisos adecuados para las acciones sobre las instancias EC2.



# Bibliografía


[1] [Mariusz Michalowski, "What is Terraform? What is it Used For, How it Works,"](https://spacelift.io/blog/what-is-terraform) *Spacelift*, 8 de abril de 2024.

[2] [S. Hernandez y Y. Huang, "Terraform stacks, explained"](https://www.hashicorp.com/blog/terraform-stacks-explained), *HashiCorp*, 27 de noviembre de 2023.

[3] [Deepak Kumar Sharma, "Terraform Beginner’s Guide: Everything You Should Know"](https://k21academy.com/terraform-iac/terraform-beginners-guide/), *K21Academy*, 5 de febrero de 2024.

[4] [Zero To Mastery, "What is Terraform? | Terraform Explained"](https://www.youtube.com/watch?v=lIaUz2GAqEQ), *YouTube*, 2 de marzo de 2023.

[5] [Zeal Vora, "Ultimate Guide to Terraform: From Beginner to Expert"](https://www.zero2devops.com/blog/ultimate-guide-to-terraform), *Zero to Devops*, 7 de octubre.

[6] [Fresh Consulting, "Using Terraform to Overcome Critical Cloud Challenges"](https://www.freshconsulting.com/insights/blog/using-terraform-to-overcome-critical-cloud-challenges/), *Fresh Consulting Insights*, 7 de junio de 2023.

[7] [HashiCorp, "Multi-cloud provisioning - Terraform by HashiCorp"](https://www.terraform.io/docs/index.html), *Terraform Official Documentation*.

[8] [J. Doe, "Security in AWS: An In-Depth Guide"](https://docs.aws.amazon.com/security/), *AWS Security*, 15 de marzo de 2024.

[9] [OpenVPN, "How To"](https://openvpn.net/community-resources/how-to/), *OpenVPN Community Resources*, 22 de abril de 2023


## Agradecimientos

Quisiera expresar mi más sincero agradecimiento al profesor José Miguel Robles, cuya presentación e introducción a Terraform abrió ante mí un mundo de posibilidades. Su pasión por esta herramienta y su potencial fue lo que inspiró la elección de mi Trabajo de Fin de Grado. Gracias a su enseñanza durante el primer año, pude comprender la profundidad y la capacidad de Terraform, lo que me motivó a explorar más a fondo este tema.

Además, estoy profundamente agradecido por la paciencia y dedicación que ha mostrado hacia mí. Su disposición para resolver cualquier duda y proporcionar orientación ha sido invaluable en mi viaje académico. Su apoyo constante ha sido un pilar fundamental para mi desarrollo y progreso en este proyecto.

De nuevo, mi más profundo agradecimiento por su mentoría, conocimiento y tiempo.


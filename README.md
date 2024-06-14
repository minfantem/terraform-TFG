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


# Tabla de contenidos

1. [Introducción](#1-introducción)................................................................................................................................................................................5
   - 1.1 [Motivación](#11-motivación)...............................................................................................................................................................5
   - 1.2 [Objetivos](#12-objetivos)...................................................................................................................................................................5
   - 1.3 [Estructura del proyecto](#13-estructura-del-proyecto).......................................................................................................................................6
   - 1.4 [Planificación](#14-planificación).............................................................................................................................................................7
1. [Diagrama de red](#2-diagrama-de-red).........................................................................................................................................................................8
1. [Estado del arte](#3-estado-del-arte).............................................................................................................................................................................9
   - 3.1 [Infraestructura como código (IaC)](#31-infraestructura-como-código-iac)..................................................................................................................9
   - 3.2 [Terraform: Conceptos básicos](#32-terraform-conceptos-básicos)...........................................................................................................................9
   - 3.3 [AWS: Proveedor de servicios en la nube](#33-aws-proveedor-de-servicios-en-la-nube).....................................................................................................11
1. [Herramientas necesarias](#4-herramientas-necesarias)........................................................................................................................................................12
   - 4.1 [Terraform](#41-terraform)..................................................................................................................................................................13
   - 4.2 [AWS CLI](#42-aws-cli).....................................................................................................................................................................13
   - 4.3 [VSCode](#43-vscode)......................................................................................................................................................................14
   - 4.4 [Git](#44-git)................................................................................................................................................................................14
1. [Configuración de recursos](#5-configuración-de-recursos).....................................................................................................................................................15
   - 5.1 [Configuración de redes virtuales](#51-configuración-de-redes-virtuales)....................................................................................................................16
   - 5.2 [Gestión de instancias](#52-gestión-de-instancias)...........................................................................................................................................20
1. [Seguridad y políticas](#6-seguridad-y-políticas)................................................................................................................................................................24
   - 6.1 [Políticas de seguridad](#61-políticas-de-seguridad)..........................................................................................................................................24
   - 6.2 [Control de acceso y gestión de identidades](#62-control-de-acceso-y-gestión-de-identidades)..............................................................................................26
   - 6.3 [Administración de usuarios y roles](#63-administración-de-usuarios-y-roles)................................................................................................................27
1. [Creación de una VPN personalizada](#7-creación-de-una-vpn-personalizada)..................................................................................................................................28
   - 7.1 [Implementación con Terraform](#71-implementación-con-terraform).......................................................................................................................28
   - 7.2 [Scripts y plantillas reutilizables](#72-scripts-y-plantillas-reutilizables)........................................................................................................................29
1. [Instrucciones de uso](#8-instrucciones-de-uso).................................................................................................................................................................33
   - 8.1 [Configuración inicial](#81-configuración-inicial).............................................................................................................................................33
   - 8.2 [Despliegue de recursos](#82-despliegue-de-recursos).......................................................................................................................................34
   - 8.3 [Inputs y outputs](#83-inputs-y-outputs).....................................................................................................................................................36
   - 8.4 [Prueba de conectividad VPN](#84-prueba-de-conectividad-vpn).............................................................................................................................38
   - 8.5 [Eliminación de la infraestructura](#85-eliminación-de-la-infraestructura)......................................................................................................................39
   - 8.6 [Control de instancias EC2 mediante scripting ](#86-control-de-instancias-ec2-mediante-scripting)...........................................................................................40
1. [Optimización de costes](#9-optimización-de-costes)............................................................................................................................................................41
   - 9.1 [Análisis de costos y eficiencia](#91-análisis-de-costos-y-eficiencia)............................................................................................................................41
   - 9.2 [Optimización de recursos](#92-optimización-de-recursos)....................................................................................................................................42 
1. [Futuro y caminos por explorar](#10-futuro-y-caminos-por-explorar)...............................................................................................................................................42
   - 10.1 [Lista de mejoras](#101-lista-de-mejoras)....................................................................................................................................................42
   - 10.2 [Terraform Cloud: Preparando el terreno para la colaboración futura](#102-terraform-cloud-preparando-el-terreno-para-la-colaboración-futura).............................................43
1. [Resultados y conclusiones](#11-resultados-y-conclusiones).......................................................................................................................................................45
   - 11.1 [Logros alcanzados](#111-logros-alcanzados)................................................................................................................................................46
   - 11.2 [Limitaciones y desafíos enfrentados](#112-limitaciones-y-desafíos-enfrentados).............................................................................................................46
   - 11.3 [Recomendaciones para futuras investigaciones](#113-recomendaciones-para-futuras-investigaciones)......................................................................................46
1. [Bibliografía y agradecimientos](#12-bibliografía)...............................................................................................................................................47


# Índice de figuras

| # | Descripción | Página |
|--|--|--|
| 1  |  [Diagrama de red de infraestructura en la nube](#2-diagrama-de-red) | 8 |
| 2  |  [Cuadrante Mágico 2023 para la infraestructura en la nube como servicio](#33-aws-proveedor-de-servicios-en-la-nube) | 11 |
| 3  |  [Gasto mundial en servicios en la nube, primer trimestre de 2024](#33-aws-proveedor-de-servicios-en-la-nube) | 12 |
| 4  |  [Selección de proveedores](#511-proveedores) | 18 |
| 5  |  [Configuración del ID “OpenVPN”](#512-recursos) | 18 |
| 6  |  [Ejemplo del archivo “variables.tf”](#513-variables) | 19 |
| 7  |  [Contenido del archivo “terraform.tfvars”](#513-variables) | 20 |
| 8  |  [Resultados después de ejecutar “terraform apply”](#514-outputs) | 20 |
| 9  |  [Permisos de usuario IAM “mario” en AWS](#63-administración-de-usuarios-y-roles) | 27 |
| 10 |  [Ejemplo demostrativo del comando "ssh-keygen"](#pasos-para-la-configuración-de-claves-ssh) | 28 |
| 11 |  [Configuración de clave pública y privada en el código sin comprometer la infraestructura](#pasos-para-la-configuración-de-claves-ssh) | 29 |
| 12 |  [Empleo de la clave pública y privada](#pasos-para-la-configuración-de-claves-ssh) | 29 |
| 13 |  [Inicialización de Terraform](#1-inicialización-de-terraform) | 34 |
| 14 |  [Resultados de la ejecución de start_stop_ec2.sh](#ventajas) | 40 |
| 15 |  [Instancia deteniéndose en AWS](#ventajas) | 40 |
| 16 |  [Análisis del costo mensual del proyecto](#91-análisis-de-costos-y-eficiencia) | 41 |
| 17 |  [Captura de pantalla del panel de Workspaces en Terraform Cloud](#102-terraform-cloud-preparando-el-terreno-para-la-colaboración-futura) | 43 |
| 18 |  [Captura de pantalla de la vista general (Overview) en Terraform Cloud](#102-terraform-cloud-preparando-el-terreno-para-la-colaboración-futura) | 43 |
| 19 |  [Captura de pantalla del panel de Runs en Terraform Cloud](#102-terraform-cloud-preparando-el-terreno-para-la-colaboración-futura) | 44 |


<br><br><br><br><br><br><br><br><br><br><br><br>

# 1. Introducción

El despliegue de infraestructuras en la nube es un proceso crítico para las organizaciones modernas. **Terraform**, una herramienta de **infraestructura como código (IaC)**, permite automatizar y gestionar recursos en la nube de manera eficiente. En este proyecto, exploraremos cómo utilizar Terraform para implementar infraestructuras en el proveedor **AWS**.

Este proyecto se centra en la utilización de Terraform para el despliegue de infraestructuras en el proveedor líder de servicios en la nube, **Amazon Web Services (AWS)**. AWS ofrece una amplia gama de servicios y recursos que pueden ser gestionados eficientemente a través de Terraform, desde el aprovisionamiento de servidores virtuales hasta la configuración de redes complejas y la implementación de políticas de seguridad.

Por último, no solo exploraremos los aspectos técnicos del uso de **Terraform**, sino también resaltaremos la importancia estratégica de adoptar prácticas de **IaC** para optimizar procesos y garantizar la seguridad en la nube.

## 1.1 Motivación

La migración hacia entornos basados en la nube ofrece ventajas como escalabilidad, flexibilidad y reducción de costos. Como estudiante, **yo mismo deseaba mucho trabajar en proyectos que involucraran despliegues en la nube**. La posibilidad de crear y administrar recursos de manera programática es una habilidad valiosa en el mundo DevOps. Terraform, al ser una herramienta de IaC, se convierte en una aliada poderosa para automatizar tareas repetitivas y garantizar la consistencia en la infraestructura.

## 1.2 Objetivos

Los objetivos de este proyecto son:

- **Investigar las mejores prácticas para el despliegue de infraestructuras en la nube con Terraform**: Profundizar en la literatura técnica y casos de estudio para identificar estrategias efectivas que mejoren la implementación y gestión de infraestructuras en AWS.

- **Configurar redes virtuales (VPC) e instancias**: Diseñar y establecer una red virtual privada (VPC) que proporcione un entorno aislado y seguro en AWS, junto con la configuración de instancias EC2 que se ajusten a las necesidades específicas del proyecto.

- **Aplicar políticas de seguridad robustas para proteger los recursos en la nube**: Desarrollar un conjunto de políticas de seguridad que aseguren la integridad, confidencialidad y disponibilidad de los datos y servicios en la nube.

- **Configurar y automatizar una VPN**: Implementar una solución de Red Privada Virtual (VPN) que no solo permita conexiones seguras y privadas para la transmisión de datos sensibles, sino que también esté completamente automatizada para facilitar su despliegue y mantenimiento.

<br><br><br><br>

## 1.3 Estructura del proyecto

El trabajo se organizará en capítulos diseñados para cumplir con los objetivos previamente establecidos. A continuación, se presenta un esquema de los capítulos que compondrán el trabajo:

1. **Introducción:**
   - Presentamos la motivación detrás del proyecto y establecemos los objetivos que buscamos lograr. Es una introducción esencial para comprender el contexto general del trabajo.

1. **Diagrama de red:**
   - Utilizaremos la herramienta **draw.io** para crear un esquema gráfico que represente la arquitectura de red propuesta. Este diagrama visualizará las conexiones, componentes y flujos de datos relevantes para nuestro proyecto.

1. **Estado del arte:**
   - Revisaremos y repasaremos los conocimientos previos necesarios para comprender completamente el contenido y los conceptos que se explorarán en los siguientes capítulos. Es fundamental establecer una base sólida antes de profundizar en detalles técnicos.

1. **Herramientas necesarias:**
   - Detallaremos el software esencial y las herramientas necesarias para comenzar a trabajar con **Terraform** y **AWS**. Estas herramientas serán clave en el desarrollo y éxito del proyecto.

1. **Configuración de recursos:**
   - En este capítulo, nos centraremos en la creación de redes virtuales (VPC) y subredes. Además, implementaremos instancias **EC2** según las necesidades específicas del proyecto.

1. **Seguridad y políticas:**
   - Configuraremos grupos de seguridad para proteger nuestros recursos en la nube. También aplicaremos políticas de acceso y control para garantizar la seguridad y el cumplimiento normativo.

1. **Automatización de la VPN:**
   - Diseñaremos y crearemos una VPN completamente automatizada utilizando Terraform. Realizaremos pruebas exhaustivas para asegurar su correcto funcionamiento.

1. **Instrucciones de uso:**
   - Proporcionaremos instrucciones claras y concisas sobre cómo utilizar y mantener la infraestructura desplegada. Esto incluirá pasos para configurar y escalar los recursos según las necesidades cambiantes.

1. **Optimización de costes:**
   - Aquí nos enfocaremos en **reducir los gastos operativos en la nube** sin sacrificar eficiencia. Exploraremos cómo Terraform puede ayudarnos a maximizar la utilidad de los recursos mientras minimizamos los costos en AWS.

1. **Futuro:**
   - Reflexionaremos sobre las posibilidades futuras del proyecto. **¿Cómo podría evolucionar?** ¿Qué mejoras podríamos implementar? ¿Hay oportunidades para expandir su alcance?

1. **Conclusiones:**
   - Finalmente, resumiremos los logros, **desafíos** y **aprendizajes obtenidos** durante el proyecto. Evaluaremos su viabilidad y aplicabilidad en el mundo real, considerando posibles publicaciones o implementaciones en el mercado.

1. **Bibliografía y agradecimientos:**
   - En esta sección, citaremos las fuentes utilizadas y expresaremos nuestra gratitud a quienes contribuyeron al éxito de este proyecto.

 La automatización y la flexibilidad serán aspectos clave en nuestra implementación.


## 1.4 Planificación

Es crucial para el éxito de cualquier proyecto realizar una planificación detallada. He dividido mi tiempo en las siguientes fases, asegurando una ejecución eficiente y eficaz.


| Semana | Tarea                           | Duración |
|--------|---------------------------------|----------|
| 1 - 4  | Investigación y fundamentos     | 4 semanas|
| 5      | Diagrama de red                 | 1 semana |
| 6      | Herramientas necesarias         | 1 semana |
| 7 - 8  | Configuración de recursos       | 2 semanas|
| 9      | Seguridad y políticas           | 1 semana |
| 10 - 12| Automatización de la VPN        | 3 semanas|
| 13     | Optimización de costes          | 1 semana |

**Total: 13 semanas**

Esta tabla resume el tiempo que he dedicado a cada una de las secciones principales de mi proyecto, proporcionando una visión general clara de mi planificación y gestión del tiempo.


### Investigación y fundamentos
- **Semanas 1-4**: He dedicado el primer mes completo a la investigación profunda de los fundamentos teóricos que sustentan mi proyecto. Esto incluye estudios sobre infraestructura como código, VPNs y seguridad en la nube.

### Diagrama de red
- **Semana 5**: En la quinta semana, me centré en el desarrollo del diagrama de red, lo que me permitió planificar visualmente la arquitectura de la VPN.

### Herramientas necesarias
- **Semana 6**: La sexta semana la reservé para seleccionar y familiarizarme con las herramientas necesarias para el proyecto, como Terraform, AWS CLI y Git.

### Configuración de recursos
- **Semanas 7-8**: Durante estas dos semanas, configuré los recursos en la nube utilizando Terraform, incluyendo la creación de VPCs, subredes y la instancia EC2 para OpenVPN.

### Seguridad y políticas
- **Semana 9**: La novena semana la dediqué a establecer políticas de seguridad y controles de acceso, garantizando la protección de la infraestructura.

### Automatización de la VPN
- **Semanas 10-12**: Asigné tres semanas para la automatización de la VPN, implementando scripts y plantillas reutilizables para facilitar la gestión y el despliegue.

### Optimización de costes
- **Semana 13**: Finalmente, la última semana la destiné a la optimización de costes, evaluando el uso de recursos y ajustando configuraciones para mejorar la eficiencia de costes.



# 2. Diagrama de red

<div style="display: block; margin: 0 auto; text-align: center;">
    <img src="./img/TFG_Diagrama.drawio.png" alt="Diagrama_red" width="70%" height="50%">
    <p class="centered-text">Figura 1. Diagrama de red de infraestructura en la nube</p>
</div>



## 2.1 Elementos de red


En mi proyecto, he diseñado una arquitectura VPN que se integra dentro de una **VPC (Virtual Private Cloud)** con una dirección IP principal de **10.0.0.0/16**. Dentro de esta VPC, he establecido una **subred pública** con una dirección IP de **10.0.0.0/24**, donde reside una **instancia pública EC2**. Esta instancia EC2 es crucial, ya que aloja el **servidor OpenVPN**, que es el corazón de mi VPN personalizada.



# 3. Estado del arte

En el contexto de mi proyecto TFG, el "Estado del Arte" representa la cúspide de los desarrollos actuales en el campo de la infraestructura como código (IaC). Esta sección busca explorar y documentar las prácticas, herramientas y metodologías más avanzadas y efectivas que están definiendo la industria hoy en día. Al comprender el estado actual de la tecnología y las mejores prácticas, puedo posicionar mi proyecto en la vanguardia del desarrollo de infraestructuras en la nube, asegurando que mi trabajo no solo sea relevante, sino también innovador y alineado con las tendencias actuales.


## 3.1 Infraestructura como código (IaC)

Actualmente IaC es una práctica de ingeniería que utiliza código para manejar y provisionar infraestructuras de TI. Esta metodología transforma la infraestructura tradicional, donde los cambios se realizan manualmente o mediante herramientas de configuración interactivas, en una infraestructura definida por archivos de configuración o scripts. Esto permite a los equipos de desarrollo y operaciones automatizar la configuración y el despliegue de infraestructuras, lo que resulta en procesos más rápidos, consistentes y replicables.

## 3.2 Terraform: Conceptos básicos

Desde su concepción por HashiCorp, **Terraform** ha emergido como una solución líder en el ámbito de la **Infraestructura como Código (IaC)**. Esta herramienta de código abierto empodera a los usuarios para diseñar y desplegar infraestructuras de manera declarativa, empleando el **HashiCorp Configuration Language (HCL)**, un lenguaje de configuración que combina simplicidad con potencia. HCL está diseñado para ser legible y escribible por humanos, y se centra en la expresión de la intención de infraestructura con la menor cantidad de construcciones posibles.

Un archivo de configuración de Terraform describe los componentes de la infraestructura necesarios para ejecutar una aplicación o servicio. Terraform genera un plan de ejecución que describe qué acciones se necesitan para alcanzar el estado deseado y luego ejecuta el plan para construir la infraestructura descrita. Terraform es idempotente, lo que significa que el mismo conjunto de configuraciones aplicará el mismo estado sin crear cambios redundantes.

<br><br><br><br><br><br><br><br>

### Ejemplos de uso de Terraform:

### Creación de infraestructura de red
```ruby
resource "aws_vpc" "mi_vpc" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "mi_subnet" {
  vpc_id     = aws_vpc.mi_vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-west-2a"
}
```

### Implementación de aplicaciones

También se puede utilizar para automatizar la implementación de aplicaciones en AWS, incluyendo la creación de instancias de EC2 y la configuración de políticas de escalado automático. Por ejemplo:

```ruby
resource "aws_instance" "mi_instancia" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  key_name      = "mi_keypair"
  security_groups = [aws_security_group.mi_sg.name]

  tags = {
    Name = "MiInstanciaEC2"
  }
}
```

### Gestión de bases de datos

Es posible crear y gestionar bases de datos en AWS, como MySQL o DynamoDB. Por ejemplo: 

```ruby
resource "aws_db_instance" "mi_db" {
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  name                 = "miBaseDeDatos"
  username             = "usuario"
  password             = "contraseña"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
}
```

En definitiva es una herramienta sumamente poderosa y flexible que ofrece una gran variedad de opciones para gestionar recursos en la nube.


## 3.3 AWS: Proveedor de servicios en la nube

Como estudiante de ASIR, he observado con gran interés el crecimiento exponencial de las tecnologías en la nube. Esta revolución digital ha democratizado el acceso a recursos computacionales de vanguardia, permitiendo que tanto grandes corporaciones como dos emprendedores en su garaje puedan desarrollar aplicaciones innovadoras con una infraestructura de primer nivel a un costo reducido.

Actualmente, tres gigantes dominan el escenario del Cloud Computing: **Microsoft Azure**, **Google Cloud Platform** y **Amazon Web Services (AWS)**, cada uno ofreciendo un extenso catálogo de productos para satisfacer una variedad de necesidades. A este trío se suma **Alibaba Cloud**, que ha experimentado un notable crecimiento en los últimos tiempos.

Una ventaja significativa de estos proveedores de servicios en la nube, como AWS, Google y Azure, es su estrategia de precios competitivos y flexibles. Tradicionalmente, los costos se basaban en un modelo de pago mensual, pero estamos presenciando un cambio hacia un esquema de facturación por segundo de uso computacional, lo que refleja una tendencia más granular y ajustada al consumo real.


<div style="display: block; margin: 0 auto; text-align: center;">
    <img src="./img/gartner.png" alt="gartner" width="65%" height="50%">
    <p class="centered-text">Figura 2. Cuadrante Mágico 2023 para la infraestructura en la nube como servicio. Fuente: <a href="https://clouxter.com/blog/aws-lider-cuadrante-magico-gartner-trece-anos/">Gartner</a></p>
</div>



En el ámbito de la infraestructura y las plataformas en la nube, **AWS** se destaca como el líder indiscutible, seguido por Microsoft y Google en tercer lugar. Ha mantenido su posición en la cima durante 13 años consecutivos, gracias a su sólida capacidad de ejecución y una visión integral de sus servicios.

La comparación de precios entre AWS, Azure y Google se complica por la vasta gama de productos y servicios que ofrecen, cada uno con su propio conjunto de mecanismos de precios que varían según la configuración seleccionada. Incluso el despliegue de una única instancia en la nube implica cientos de configuraciones posibles, cada una influenciando el costo final.


<div style="display: block; margin: 0 auto; text-align: center;">
    <img src="./img/Q1_2024.png" alt="Q1_2024" width="70%" height="50%">
    <p class="centered-text">Figura 3. Gasto mundial en servicios en la nube, primer trimestre de 2024. Fuente: <a href="https://www.canalys.com/newsroom/global-cloud-market-Q1-2024">Canalys</a></p>
</div>


Observando el panorama actual, AWS emerge como el claro vencedor frente a Google y Azure, capturando aproximadamente un tercio de los ingresos del mercado, mientras que Google se queda rezagado con solo un 10% del gasto global.

### Mi elección
Después de evaluar cuidadosamente las opciones, he decidido optar por **Amazon Web Services**. Aunque las tres alternativas presentan características y servicios similares, AWS se alinea mejor con mis necesidades en varios aspectos. Por un lado, AWS tiene una estructura de precios más accesible en comparación con Azure y Google, lo cual es ideal para alguien como yo que nunca ha utilizado estos servicios y está en la fase de aprendizaje.

Además, la abundancia de tutoriales y foros en línea sobre AWS facilita enormemente el proceso de aprendizaje. Dado que las tres plataformas ofrecen una amplia gama de servicios que pueden resultar complejos al principio, contar con una comunidad activa y recursos educativos es invaluable.

En conclusión, al ser AWS el pionero y líder indiscutible en servicios de computación en la nube, representa la elección más lógica para mi proyecto.



# 4. Herramientas necesarias

Para el despliegue de infraestructuras con Terraform, he elegido Linux como mi entorno de desarrollo principal. Esta decisión no es casualidad; Linux se alinea perfectamente con los principios de eficiencia, estabilidad y seguridad que son fundamentales en el mundo del desarrollo de software.

Linux me brinda una plataforma sólida y confiable, ideal para manejar las complejidades de la infraestructura como código. Su naturaleza de código abierto me permite personalizar mi entorno de desarrollo a medida que avanzo en mi proyecto TFG. Además, la amplia comunidad de Linux ofrece un soporte inigualable, lo que me asegura que siempre tendré acceso a las últimas herramientas y mejores prácticas.

En este entorno, Terraform se convierte en una herramienta poderosa, permitiéndome definir de manera declarativa la infraestructura necesaria para mis aplicaciones y servicios. La integración con AWS a través de la línea de comandos es fluida, y la capacidad de versionar mi código con Git complementa mi flujo de trabajo, asegurando que cada cambio esté documentado y sea reproducible.

En los siguientes capítulos, detallaré cómo la combinación de Terraform y Linux se convierte en un dúo dinámico para el despliegue eficiente y seguro de infraestructuras en la nube, demostrando por qué esta combinación es la elección preferida para desarrolladores y empresas por igual.


## 4.1 Terraform
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


## 4.2 AWS CLI
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

## 4.3 VSCode
**Visual Studio Code (VSCode)** es un editor de código fuente desarrollado por Microsoft. Es mi editor de código fuente preferido. Su naturaleza gratuita y de código abierto, junto con su amplia gama de extensiones, lo hacen ideal para trabajar con Terraform y otros lenguajes de programación.

- **Extensiones para Terraform**: He mejorado mi experiencia de desarrollo instalando extensiones específicas para Terraform en VSCode, como la extensión de Terraform que proporciona resaltado de sintaxis y autocompletado.

- **Integración con Git**: La integración nativa de VSCode con Git me facilita la gestión de versiones de mis archivos de configuración de Terraform, permitiéndome realizar confirmaciones y ramificaciones directamente desde el editor.


## 4.4 Git
**Git** es fundamental para mi proyecto, ya que es el sistema de control de versiones que utilizaré a futuro para mantener un historial de cambios, colaborar con otros y desplegar código de manera controlada mediante un repositorio de GitHub.


- **Comandos básicos de Git**:

   ```bash
   git init # Comienzo cada nuevo proyecto inicializando un repositorio Git.
   git add <archivo> # Agrego cambios al área de preparación.
   git commit -m "Mensaje de confirmación" # Confirmo mis cambios con un mensaje descriptivo.
   git push origin <rama> # Envío mis cambios al repositorio remoto para compartirlos con mi equipo.
   ```


# 5. Configuración de recursos

Para comenzar con la configuración de recursos, es imprescindible tener instalado Visual Studio Code (VS Code) con la extensión HashiCorp Terraform. Esta extensión proporciona herramientas y características específicas para trabajar de manera efectiva con archivos de configuración de Terraform en el entorno de desarrollo.

En la infraestructura como código, la configuración de recursos es crucial. En esta sección, se detallan los pasos y consideraciones clave para configurar los recursos de la nube de manera eficiente y segura.

Antes de empezar con la configuración es importante detenerse y hablar sobre **DRY**.

### DRY (Don't Repeat Yourself) y su importancia

Para mí, DRY (Don't Repeat Yourself) es fundamental en mi proyecto. Este principio de desarrollo de software aboga por la reducción de la duplicación de código y datos en un sistema, asegurando que cada parte del conocimiento tenga una única representación, lo ayuda a mantenerlo y hacerlo más flexible.

### Importancia de DRY

- **Mantenimiento simplificado**: Al evitar la duplicación, el mantenimiento se vuelve más sencillo. Los cambios solo necesitan hacerse en un lugar, lo que minimiza los errores y facilita las actualizaciones.
- **Consistencia mejorada**: Seguir DRY promueve la consistencia en todo el código, lo que facilita la comprensión y colaboración entre el equipo.
- **Reutilización de código**: La reutilización del código se fomenta, lo que aumenta la eficiencia y la escalabilidad del proyecto.

### Uso de DRY en mi proyecto

En mi proyecto de fin de grado, he aplicado DRY de diversas maneras:

1. **División de configuración en archivos _.tf_**:
   - He dividido la configuración de infraestructura en varios archivos **.tf** según su funcionalidad, como **vpc.tf**, **ec2.tf**, **providers.tf**, **outputs.tf**, etc. Esto mejora la organización y comprensión del código.

2. **Archivo _variables.tf_**:
   - Utilizo **variables.tf** para definir todas las variables del proyecto. Esto centraliza la configuración de las variables, lo que facilita su gestión y actualización.

3. **Uso de _terraform.tfvars_**:
   - El archivo **terraform.tfvars** almacena los valores de las variables utilizadas en el proyecto. Esta separación entre la configuración y el código de infraestructura facilita la personalización y gestión de la configuración.

Mediante la aplicación de DRY, logro una configuración de infraestructura más limpia, organizada y fácil de mantener, lo que mejora la eficiencia y la calidad de mi proyecto.


## 5.1 Configuración de redes virtuales

La creación de una red virtual es el primer paso para establecer un entorno aislado y seguro en la nube. Se abordarán temas como la definición de VPCs, subredes, tablas de rutas.


### Creación de VPC

```ruby
# Define un VPC en AWS
resource "aws_vpc" "openvpn" {
  # Especifica el rango de direcciones IP para el VPC usando una variable
  cidr_block = var.cidr_block

  # Habilita los nombres de host DNS para las instancias dentro del VPC
  enable_dns_hostnames = true

  # Habilita el soporte DNS dentro del VPC
  enable_dns_support = true

  # Añade etiquetas al VPC
  tags = {
    Name        = var.tag_name        # Nombre del VPC, definido por una variable
    Provisioner = "Terraform"         # Indicador de que fue provisionado con Terraform
  }
}
```

### Explicación de los comentarios:
- **aws_vpc**: Este bloque define un VPC en AWS con las configuraciones especificadas.
  - **cidr_block**: Establece el rango de direcciones IP para el VPC usando una variable _var.cidr_block_.
  - **enable_dns_hostnames**: Habilita los nombres de host DNS, lo cual es útil para que las instancias dentro del VPC puedan ser referenciadas por nombre en lugar de por dirección IP.
  - **enable_dns_support**: Habilita el soporte DNS dentro del VPC, lo cual permite la resolución de nombres DNS.
  - **tags**: Añade etiquetas al VPC para identificación y administración. 

<br>

### Configuración de subredes

```ruby
# Define una subred dentro de un VPC existente
resource "aws_subnet" "openvpn" {
  # Especifica el ID del VPC donde se creará la subred
  vpc_id     = aws_vpc.openvpn.id
  
  # Define el rango de direcciones IP para la subred usando una variable y la función cidrsubnet
  cidr_block = cidrsubnet(var.cidr_block, 8, 0)

  # Añade etiquetas a la subred
  tags = {
    Name        = var.tag_name        
    Provisioner = "Terraform"         
  }
}

# Define una puerta de enlace de Internet para el VPC
resource "aws_internet_gateway" "openvpn" {
  # Especifica el ID del VPC al que se adjuntará la Internet Gateway
  vpc_id = aws_vpc.openvpn.id

  # Añade etiquetas a la Internet Gateway
  tags = {
    Name        = var.tag_name        
    Provisioner = "Terraform"         
  }
}

# Define una tabla de rutas para el VPC
resource "aws_route_table" "openvpn" {
  # Especifica el ID del VPC para el cual se crea la tabla de rutas
  vpc_id = aws_vpc.openvpn.id

  # Define una ruta dentro de la tabla de rutas
  route {
    # Todo el tráfico (0.0.0.0/0) se dirigirá hacia la Internet Gateway
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.openvpn.id
  }
}

# Asocia la subred creada con la tabla de rutas
resource "aws_route_table_association" "openvpn" {
  # Especifica el ID de la subred que se asociará con la tabla de rutas
  subnet_id      = aws_subnet.openvpn.id
  
  # Especifica el ID de la tabla de rutas con la que se asociará la subred
  route_table_id = aws_route_table.openvpn.id
}
```

### Explicación de los comentarios:
- **aws_subnet**: Este bloque define una subred dentro del VPC especificado y le asigna un rango de direcciones IP (CIDR).
- **aws_internet_gateway**: Este bloque crea una Internet Gateway y la asocia con el VPC, permitiendo que los recursos dentro del VPC tengan acceso a Internet.
- **aws_route_table**: Este bloque crea una tabla de rutas que redirige todo el tráfico a Internet a través de la Internet Gateway.
- **aws_route_table_association**: Este bloque asocia la subred con la tabla de rutas creada, asegurando que el tráfico de la subred siga la ruta definida.

Cada bloque incluye etiquetas (tags) para identificación y administración, y utiliza variables (_var.cidr_block_, _var.tag_name_) que deben definirse en otro lugar del archivo de configuración de Terraform.




## 5.1.1 Proveedores
En esta sección, he especificado **AWS** como el proveedor de servicios en la nube para mi aplicación. He optado por definir explícitamente la versión del proveedor que Terraform debe utilizar para garantizar la consistencia a lo largo del desarrollo. Si no se especifica una versión, Terraform utilizará la más reciente disponible.

<div style="display: block; margin: 0 auto; text-align: center;">
    <img src="./img/providers.png" alt="providers" width="90%" height="50%">
    <p class="centered-text">Figura 4. Selección de proveedores</p>
</div>



## 5.1.2 Recursos
He detallado la infraestructura necesaria para mi proyecto, que incluye instancias, redes y soluciones de almacenamiento. Para cada recurso, he definido cuidadosamente dos parámetros esenciales: el **tipo de recurso** y el **identificador único (ID)** del recurso.

### Ejemplo:

<div style="display: block; margin: 0 auto; text-align: center;">
    <img src="./img/recurso1.png" alt="recurso1" width="70%" height="50%">
    <p class="centered-text">Figura 5. Configuración del ID “OpenVPN”</p>
</div>


## 5.1.3 Variables
Cómo en cualquier código las variables son elementos fundamentales, ya que nos permiten almacenar y manipular datos de manera dinámica. En mi arquitectura, he definido variables con nombres descriptivos para facilitar la comprensión y el mantenimiento del código. Cada variable está claramente comentada para explicar su propósito y cómo se utiliza en el contexto del programa.


Es crucial destacar que, para una gestión eficiente de las variables, he optado por emplear dos archivos distintos: **variables.tf** y **terraform.tfvars**. El archivo **variables.tf** contiene la declaración de todas las variables junto con sus tipos y, si es aplicable, valores por defecto. Esto sirve como una referencia centralizada que facilita la identificación de los parámetros configurables dentro de la infraestructura.

Por otro lado, el archivo **terraform.tfvars** se utiliza para asignar valores concretos a las variables declaradas. Esta separación de declaración y asignación permite una mayor claridad y hace que la configuración sea más accesible para ajustes y personalización en diferentes entornos o escenarios de despliegue.

Cada variable dentro de **variables.tf** está acompañada de comentarios explicativos que detallan su propósito y cómo influyen en la configuración de la infraestructura. Además, los valores especificados en **terraform.tfvars** están cuidadosamente seleccionados para alinearse con las mejores prácticas y requisitos del proyecto actual.

La combinación de estos dos archivos constituye una estrategia robusta que no solo mejora la legibilidad del código, sino que también asegura una gestión de configuración coherente y eficaz, que se alinea con la **filosofía DRY**. Al utilizar variables.tf para la declaración de variables y terraform.tfvars para la asignación de valores, se evita la repetición innecesaria y se fomenta la reutilización del código.


### _variables.tf_:

<div style="display: block; margin: 0 auto; text-align: center;">
    <img src="./img/vars.png" alt="vars" width="85%" height="50%">
    <p class="centered-text">Figura 6. Ejemplo del archivo “variables.tf”</p>
</div>


<br>

### _terraform.tfvars_:

<div style="display: block; margin: 0 auto; text-align: center;">
    <img src="./img/tfvars.png" alt="tfvars" width="60%" height="50%">
    <p class="centered-text">Figura 7. Contenido del archivo “terraform.tfvars”</p>
</div>


## 5.1.4 Outputs
En esta sección, describo cómo cada output se deriva de las operaciones realizadas y cómo estos pueden ser utilizados o mostrados al usuario final. La estructuración clara de los outputs asegura que los resultados sean fáciles de entender y de integrar en otros sistemas o módulos si es necesario.

### Ejemplo:

<div style="display: block; margin: 0 auto; text-align: center;">
    <img src="./img/outputs.png" alt="outputs" width="100%" height="50%">
    <p class="centered-text">Figura 8. Resultados después de ejecutar “terraform apply”</p>
</div>



## 5.1.5 Comandos útiles de Terraform

- **terraform init**: Inicializa mi proyecto de Terraform, configurando el entorno y descargando los módulos necesarios.
- **terraform plan**: Me permite revisar los cambios propuestos antes de aplicarlos, mostrando qué recursos serán creados, modificados o eliminados.
- **terraform apply**: Después de confirmar el plan, este comando aplica los cambios en la infraestructura de la nube.
- **terraform destroy**: Cuando ya no necesito los recursos, este comando los elimina de la nube, limpiando el entorno.

Esta configuración y estos comandos forman la base de cómo gestiono la infraestructura de mi proyecto.


## 5.2 Gestión de instancias
En mi proyecto, la gestión de instancias abarca la creación y configuración de máquinas virtuales destinadas a alojar aplicaciones y servicios. Este proceso es fundamental para establecer el entorno necesario para ejecutar mis aplicaciones de manera efectiva y eficiente.

<br><br>

## 5.2.1 Gestión dinámica de instancias EC2

En mi implementación, he elegido las **instancias T2 de Amazon EC2** por su capacidad de proporcionar un nivel de rendimiento de CPU base, con la flexibilidad de escalar según las demandas de mis aplicaciones. Estas instancias son ideales para manejar variaciones en la carga de trabajo, permitiéndome mantener un equilibrio entre costo y eficiencia.

Para las cargas de trabajo que requieren un rendimiento de CPU más alto de manera esporádica, mis **instancias T2 ilimitadas** son capaces de sostener niveles de rendimiento elevados durante el tiempo necesario sin incurrir en costos adicionales, gracias a trabajar con la capa gratuita de Amazon Web Services (AWS). Sin embargo, si necesito un rendimiento constante y superior al nivel base, puedo hacerlo con un costo adicional fijo y previsible de **0.05 USD por cada hora de vCPU utilizada**.

La gestión del rendimiento se realiza a través de un sistema de **créditos de CPU**. Mis instancias T2 acumulan estos créditos cuando están inactivas y los consumen en períodos de alta actividad. De esta manera, puedo asegurar que tengo la potencia de procesamiento necesaria disponible cuando mis aplicaciones lo requieren, sin desperdiciar recursos.

Una vez más, este enfoque no solo me permite adaptar mis recursos a las necesidades reales de mis aplicaciones, sino que también se alinea con la filosofía **DRY** al evitar la repetición y maximizar la reutilización del código en mi infraestructura de cloud computing.


### Creación de instancias EC2
```ruby
# Crea un par de claves SSH
resource "aws_key_pair" "openvpn" {
  key_name   = var.ssh_private_key_file
  public_key = file("${path.module}/${var.ssh_public_key_file}")
}
# Crea una instancia EC2
resource "aws_instance" "openvpn" {
  # AMI (Amazon Machine Image) para la instancia
  ami                         = var.ami

  # Asocia una dirección IP pública a la instancia
  associate_public_ip_address = true
  
  # Tipo de instancia (e.g., t2.micro), definido por una variable
  instance_type               = var.instance_type
  
  # Nombre de la clave SSH que se usará para acceder a la instancia
  key_name                    = aws_key_pair.openvpn.key_name
  
  # ID de la subred donde se lanzará la instancia
  subnet_id                   = aws_subnet.openvpn.id

  # IDs de los grupos de seguridad aplicados a la instancia
  vpc_security_group_ids = [
    aws_security_group.openvpn.id,         # Grupo de seguridad para OpenVPN
    aws_security_group.ssh_from_local.id,  # Grupo de seguridad para SSH desde una red local
  ]

  # Configuración del dispositivo de bloque raíz (disco principal) de la instancia
  root_block_device {
    volume_type           = "gp2"                          # Tipo de volumen (gp2: General Purpose SSD)
    volume_size           = var.instance_root_block_device_volume_size  # Tamaño del volumen
    delete_on_termination = true                           # Eliminar el volumen al terminar la instancia
  }

  # Añade etiquetas a la instancia
  tags = {
    Name        = var.tag_name        
    Provisioner = "Terraform"         
  }
}

# Asigna una IP elástica (EIP) a la instancia EC2
resource "aws_eip" "openvpn_eip" {
  # ID de la instancia a la que se asignará la EIP
  instance = aws_instance.openvpn.id
  # Indica que la EIP es para un VPC
  vpc      = true
}
```
### Explicación de los comentarios:

- **aws_key_pair**: Define un par de claves SSH para acceder a la instancia EC2.
- **aws_instance**: Configura una instancia EC2, incluyendo el tipo de instancia, la AMI, la clave SSH, la subred y los grupos de seguridad.
- **aws_eip**: Asigna una IP elástica a la instancia EC2, asegurando que tenga una IP pública fija.

## 5.2.2 Recursos null


Al trabajar con Terraform, a menudo necesito ejecutar comandos o scripts que no crean infraestructura directamente, pero son cruciales para configurar el entorno. Aquí es donde uso los recursos **null_resource**.

### ¿Qué es un null_resource?

Un **null_resource** en Terraform es un recurso que no crea infraestructura. En cambio, me permite ejecutar acciones como comandos o scripts necesarios para completar la configuración de mi proyecto.

### ¿Para qué los uso?

- **Automatización**: Ejecutar scripts de configuración y actualización en mis instancias EC2.
- **Integración**: Copiar archivos necesarios a mis servidores.
- **Personalización**: Realizar tareas post-provisionamiento, como instalar software o ajustar configuraciones.

### Tipos

- **local-exec**: Ejecuto comandos en mi máquina local donde estoy ejecutando Terraform. Lo uso para realizar acciones en mi propia máquina, como la creación de archivos locales o la ejecución de scripts localmente.

- **remote-exec**: Ejecuto comandos en una máquina remota, como una instancia EC2 provisionada por Terraform. Lo utilizo para configurar o realizar acciones en servidores remotos, como la instalación de software o la configuración de servicios.

### Ejemplo práctico

- **Arrancar VPN**: Conecto a mi instancia EC2 y configuro OpenVPN automáticamente.
   ```ruby
   resource "null_resource" "openvpn_bootstrap" {
   # Configuración de la conexión SSH a la instancia EC2
   connection {
      type        = "ssh"
      host        = aws_eip.openvpn_eip.public_ip        # IP pública de la instancia
      user        = var.ec2_username                     # Usuario SSH
      port        = "22"                                 # Puerto SSH
      private_key = file("${path.module}/${var.ssh_private_key_file}")  # Clave privada SSH
      agent       = false
   }

   # Provisioner para ejecutar comandos remotos
   provisioner "remote-exec" {
      inline = [
         "sudo yum update -y",                             # Actualiza paquetes
         "curl -O ${var.openvpn_install_script_location}",# Descarga script de instalación de OpenVPN
         "chmod +x openvpn-install.sh",                   # Da permisos de ejecución al script
         <<EOT
         sudo AUTO_INSTALL=y \
            APPROVE_IP=${aws_eip.openvpn_eip.public_ip} \
            ENDPOINT=${aws_eip.openvpn_eip.public_dns} \
            ./openvpn-install.sh
         EOT
      ]
   }
   }
   ```
   _Este null_resource se conecta a la instancia EC2 y ejecuta una serie de comandos para instalar OpenVPN. Utiliza el provisioner remote-exec para ejecutar comandos en la instancia remota._

<br>

- **Descargar configuraciones**: Utilizo un **null_resource** para descargar configuraciones desde la instancia a mi máquina local.

   ```ruby
   # Recurso nulo para escribir información de la instancia en un archivo local
   resource "null_resource" "write_instance_info" {
   provisioner "local-exec" {
      command = <<-EOT
         echo "Información de la instancia EC2 OpenVPN:" >> datos_ec2_OpenVPN.txt
         echo "--------------------------------------" >> datos_ec2_OpenVPN.txt
         echo "DNS público de la instancia: ${aws_eip.openvpn_eip.public_dns}" >> datos_ec2_OpenVPN.txt
         echo "IP pública de la instancia: ${aws_eip.openvpn_eip.public_ip}" >> datos_ec2_OpenVPN.txt
         echo "Cadena de conexión SSH: 'ssh -i ${var.ssh_private_key_file} ${var.ec2_username}@${aws_eip.openvpn_eip.public_dns}'" >> datos_ec2_OpenVPN.txt
         echo "ID de la instancia EC2: ${aws_instance.openvpn.id}" >> datos_ec2_OpenVPN.txt
      EOT
   }
   }
   ```

En conclusión, los recursos **null_resource** son esenciales para automatizar tareas y asegurar que mi infraestructura esté completamente configurada y lista para usar.

# 6. Seguridad y políticas

A día de hoy es imprescindible abordar la seguridad con la seriedad que merece. Por ello,  he dedicado un capítulo completo a establecer políticas de seguridad meticulosas y controles de acceso que protegen los recursos críticos y servicios de mi infraestructura en la nube. Estas políticas son restrictivas por diseño, proporcionando acceso solo cuando es absolutamente necesario y solo a aquellos usuarios y servicios que lo requieren.

## 6.1 Políticas de seguridad

Implementar políticas restrictivas es esencial para proteger recursos sensibles. Estas políticas deben ser específicas y otorgar el mínimo acceso necesario para realizar una tarea. Por ejemplo, para la instancia de servidor que alberga el servicio de VPN, he configurado grupos de seguridad que limitan el acceso a los puertos necesarios y solo permite el acceso SSH desde direcciones IP de confianza.


### Política de grupo de seguridad para OpenVPN

```ruby
resource "aws_security_group" "openvpn" {
  name        = "openvpn"                            
  description = "Permitir acceso UDP entrante a OpenVPN y salida no restringida"  

  vpc_id = aws_vpc.openvpn.id                         # ID del VPC al que se asociará el grupo de seguridad

  # Etiquetas para identificar y gestionar el grupo de seguridad
  tags = {
    Name        = var.tag_name                       
    Provisioner = "Terraform"                         
  }

  # Reglas de entrada que permiten el tráfico UDP en el puerto 1194 desde cualquier origen
  ingress {
    from_port   = 1194                                # Puerto de origen
    to_port     = 1194                                # Puerto de destino
    protocol    = "udp"                               # Protocolo UDP
    cidr_blocks = ["0.0.0.0/0"]                       # Rango de direcciones IP permitidas
  }

  # Reglas de salida que permiten cualquier tráfico de salida desde el grupo de seguridad
  egress {
    from_port   = 0                                   # Puerto de origen
    to_port     = 0                                   # Puerto de destino
    protocol    = "-1"                                # Cualquier protocolo permitido
    cidr_blocks = ["0.0.0.0/0"]                       # Rango de direcciones IP permitidas
  }
}
```
Este grupo de seguridad permite el acceso UDP entrante a OpenVPN en el puerto 1194 desde cualquier dirección IP, y también permite cualquier tráfico de salida.

### Política de grupo de seguridad para EC2
```ruby
resource "aws_security_group" "ssh_from_local" {
  name        = "ssh-from-local"                                       
  description = "Permitir acceso SSH solo desde la máquina local"       
  
  vpc_id = aws_vpc.openvpn.id                          # ID del VPC al que se asociará el grupo de seguridad

  # Etiquetas para identificar y gestionar el grupo de seguridad
  tags = {
    Name        = var.tag_name                                          
    Provisioner = "Terraform"                                          
  }

  # Regla de ingreso que permite el tráfico SSH (TCP, puerto 22) solo desde la dirección IP local
  ingress {
    from_port   = 22                                    # Puerto de origen
    to_port     = 22                                    # Puerto de destino
    protocol    = "tcp"                                 # Protocolo TCP
    cidr_blocks = [local.local_ip_address]              # Dirección IP de la máquina local
  }
}
```
Este grupo de seguridad restringe el acceso SSH a las instancias EC2 solo desde la dirección IP indicada en la variable.

### Uso de la variable _local.local_ip_address_

```ruby
data "http" "local_ip_address" {
  url = "http://ipv4.icanhazip.com"
}

locals {
  local_ip_address = "${chomp(data.http.local_ip_address.response_body)}/32"
}
```

He usado un recurso de Terraform para obtener mi dirección IP pública mediante una solicitud HTTP. Esta IP se guarda en una variable local y se le añade la notación CIDR /32, indicando que es una dirección única. Esto me permite restringir el acceso SSH a mi instancia EC2, asegurando que solo yo pueda conectarme desde mi ubicación actual, lo cual es una práctica de seguridad esencial en la gestión de infraestructuras en la nube.

Este método es particularmente útil porque:

- Automatiza la restricción de acceso: No necesitas saber tu dirección IP pública de antemano; Terraform la obtiene por ti.
- Seguridad Mejorada: Limita el acceso SSH a tu instancia EC2 solo a tu dirección IP actual, reduciendo el riesgo de intentos de acceso no autorizados.
- Facilidad de Mantenimiento: Si tu dirección IP pública cambia, simplemente puedes volver a aplicar la configuración de Terraform para actualizar la regla de seguridad automáticamente.




## 6.2 Control de acceso y gestión de identidades

Para el control de acceso y la gestión de identidades, he recurrido a **AWS Identity and Access Management** (IAM) para establecer políticas y permisos precisos que regulan quién puede acceder a qué recursos dentro de AWS. Esto incluye la creación de roles específicos para diferentes tareas y asignar estos roles a usuarios y servicios según el principio de menor privilegio.

Al implementar estas políticas y controles, garantizo que mi infraestructura en la nube no solo sea robusta y segura, sino que también cumpla con las normativas de seguridad y privacidad. Esto asegura que solo los usuarios autorizados tengan acceso a los recursos necesarios y que la infraestructura esté protegida contra amenazas externas e internas.

## 6.3 Administración de usuarios y roles

La administración de usuarios y roles es un aspecto crucial para mantener un entorno seguro. He creado roles con permisos específicos y los he asignado a usuarios y servicios de acuerdo con sus necesidades operativas, asegurándome de que cada entidad tenga solo los permisos necesarios para realizar sus funciones.

Aquí, creé un usuario IAM llamado "mario", destinado a desplegar infraestructuras utilizando Terraform a través de AWS CLI. Configuré las credenciales necesarias utilizando **aws configure**. Además, para una capa adicional de seguridad, implementé la **autenticación multifactor** (MFA). Esto garantiza que el acceso a las cuentas esté protegido por un segundo factor de autenticación, lo que refuerza la seguridad en el proceso de despliegue de infraestructuras. Para mí, esta medida es crucial, especialmente teniendo en cuenta que la cuenta "mario" tiene la capacidad de modificar la infraestructura y los recursos en la nube.

En el contexto de AWS, es esencial comprender la diferencia entre las **cuentas raíz** y las **cuentas IAM**. La cuenta raíz es la primera cuenta que se crea al registrarse en AWS y tiene todos los privilegios administrativos sobre la cuenta. Por otro lado, las cuentas IAM son entidades adicionales que se pueden crear dentro de la cuenta principal y tienen permisos limitados según las políticas asignadas.

Es crucial destacar que no es recomendable utilizar la cuenta raíz para administrar los recursos en AWS debido a la gran cantidad de privilegios que posee. En su lugar, es preferible crear cuentas IAM específicas y asignarles solo los permisos necesarios para realizar tareas específicas. Esto ayuda a reducir el riesgo de **errores humanos** o malas prácticas de seguridad que podrían comprometer la cuenta en su totalidad.

En el caso del usuario "mario", opté por seguir esta práctica recomendada al asignarle permisos específicos mediante IAM para desplegar infraestructuras con Terraform a través de **AWS CLI**. Esto garantiza que "mario" solo tenga acceso a los recursos y acciones necesarios para llevar a cabo sus tareas, en lugar de concederle acceso completo a la cuenta raíz. Los permisos que tiene "mario" son los siguientes: **AdministratorAccess** y **AWSBillingConductorFullAccess** que permiten crear, modificar y destruir recursos en la nube y manejar estimaciones dee costes respectivamente.


<div style="display: block; margin: 0 auto; text-align: center;">
    <img src="./img/permisos.png" alt="Permisos" width="100%" height="50%">
    <p class="centered-text">Figura 9. Permisos de usuario IAM “mario” en AWS</p>
</div>


En resumen, utilizar cuentas IAM con permisos limitados es fundamental para mantener la seguridad y el control sobre los recursos en AWS. Las cuentas raíz deben utilizarse con extrema precaución, reservadas solo para situaciones excepcionales que requieran **privilegios administrativos completos**.


<br><br>

# 7. Creación de una VPN personalizada

Como parte de mi proyecto TFG, he diseñado y desplegado una VPN personalizada utilizando OpenVPN en una instancia EC2. Este proceso me ha permitido profundizar en el diseño de arquitecturas de red seguras y la automatización de su implementación.


### Casos de Uso
- **Teletrabajo**: Mi VPN permite a los empleados acceder a recursos corporativos de forma segura desde ubicaciones remotas, manteniendo la continuidad del negocio.
- **Protección de datos**: Ideal para periodistas y activistas que requieren una capa adicional de seguridad para proteger la información sensible.
- **Desarrollo y pruebas**: Los desarrolladores pueden utilizar la VPN para simular entornos de producción y realizar pruebas sin exponer servicios internos.

## 7.1 Implementación con Terraform

El diseño de mi VPN se centra en la seguridad y la escalabilidad. He optado por OpenVPN por su robustez y flexibilidad. La arquitectura consta de una instancia EC2 dentro de una VPC en AWS.


## Creación de claves SSH

Para iniciar y gestionar mi servidor OpenVPN, es esencial que Terraform realice SSH en el nodo EC2. Para facilitar este proceso, utilizo un par de claves SSH específicas para este propósito.

### Pasos para la configuración de claves SSH

1. **Generación de claves SSH**: Generé mis claves SSH utilizando el comando _**ssh-keygen**_. 

   #### Ejemplo Práctico

<div style="display: block; margin: 0 auto; text-align: center;">
    <img src="./img/claves.png" alt="claves" width="90%" height="50%">
    <p class="centered-text">Figura 10. Ejemplo demostrativo del comando "ssh-keygen". No serán las claves finales utilizadas</p>
</div>


1. **Ubicación de las claves**: Coloqué la clave pública en la ruta _**settings/openvpn.pub**_ y la clave privada en _**settings/openvpn**_, rutas que Terraform tiene configuradas para el acceso.

<div style="display: block; margin: 0 auto; text-align: center;">
    <img src="./img/ubi.png" alt="ubi" width="90%" height="50%">
    <p class="centered-text">Figura 11. Configuración de clave pública y privada en el código sin comprometer la infraestructura</p>
</div>


1. **Configuración en Terraform**: Verifiqué que Terraform estuviera correctamente configurado para usar estas claves al realizar SSH en el servidor OpenVPN, lo que me permite una gestión remota eficiente y segura.

<div style="display: block; margin: 0 auto; text-align: center;">
    <img src="./img/settings.png" alt="settings" width="80%" height="50%">
    <p class="centered-text">Figura 12. Empleo de la clave pública y privada</p>
</div>

Con estos pasos, aseguro una conexión SSH fiable y segura, lo que es fundamental para los futuros pasos de aprovisionamiento y administración del servidor VPN.


## 7.2 Scripts y plantillas reutilizables

### Ventajas del despliegue automatizado de VPN con OpenVPN Server

La automatización del despliegue de mi VPN utilizando OpenVPN server a través de scripts representa una ventaja significativa en términos de **eficiencia**, **consistencia** y **escalabilidad**. Al automatizar este proceso, he logrado:

- **Reducción de tiempo**: El tiempo que se requiere para configurar y desplegar manualmente cada componente se reduce drásticamente.
- **Minimización de errores**: La posibilidad de cometer errores humanos se minimiza, ya que los scripts ejecutan las tareas de forma precisa y repetible.
- **Despliegue rápido**: Puedo desplegar o replicar mi servidor VPN en cuestión de minutos, lo cual es crucial para responder a las necesidades operativas urgentes.

### Extractos del script y decisiones clave

Aunque el script es extenso, no es necesario adentrarse en profundidad en el scripting de Bash, dado que el enfoque principal de este trabajo no es ese. No obstante, es crucial comprender algunas de las decisiones clave que se tomaron durante su desarrollo:

- **Selección de OpenVPN**: Opté por OpenVPN debido a su **seguridad probada** y su **compatibilidad** con múltiples sistemas operativos.
- **Configuración de seguridad**: Implementé reglas de firewall estrictas dentro del script para asegurar que solo el tráfico autorizado pueda acceder a la red VPN.
- **Automatización de certificados**: El script maneja la creación y distribución de certificados automáticamente mediante [Easy-RSA](https://openvpn.net/community-resources/how-to/#setting-up-your-own-certificate-authority-ca-and-generating-certificates-and-keys-for-an-openvpn-server-and-multiple-clients), el cúal es más comúnmente utilizado en escenarios donde se prefiere la automatización y el manejo desde la línea de comandos. Se utilizó Easy-RSA debido a su simplicidad y su amplio uso en entornos de OpenVPN.


Algunas funciones interesantes son:

### isRoot() 

```bash
function isRoot() {
    if [ "$EUID" -ne 0 ]; then
        return 1
    fi
}
```
**Descripción**: Esta función verifica si el script está siendo ejecutado con privilegios de superusuario (root). Comprueba si el ID de usuario efectivo (EUID) es igual a 0, que es el ID de root. Si no es así, devuelve un error.




### tunAvailable() 

```bash
function tunAvailable() {
    if [ ! -e /dev/net/tun ]; then
        return 1
    fi
}
```
**Descripción**: Comprueba si el dispositivo TUN (tunelización) está disponible en el sistema. Si el dispositivo /dev/net/tun no existe, retorna 1, indicando que el dispositivo TUN no está disponible.



### checkOS() 

```bash
function checkOS() {
    if [[ -e /etc/debian_version ]]; then
        OS="debian"
        source /etc/os-release

        if [[ "$ID" == "debian" || "$ID" == "raspbian" ]]; then
            if [[ ! $VERSION_ID =~ (8|9|10) ]]; then
                echo "Your version of Debian is not supported."
                echo ""
                echo "However, if you're using Debian >= 9 or unstable/testing then you can continue."
                echo "Keep in mind they are not supported, though."
                echo ""
                until [[ $CONTINUE =~ (y|n) ]]; do
                    read -rp "Continue? [y/n]: " -e CONTINUE
                done
                if [[ "$CONTINUE" = "n" ]]; then
                    exit 1
                fi
            fi
        elif [[ "$ID" == "ubuntu" ]]; then
            OS="ubuntu"
            if [[ ! $VERSION_ID =~ (16.04|18.04|19.04) ]]; then
                echo "Your version of Ubuntu is not supported."
                echo ""
                echo "However, if you're using Ubuntu > 17 or beta, then you can continue."
                echo "Keep in mind they are not supported, though."
                echo ""
                until [[ $CONTINUE =~ (y|n) ]]; do
                    read -rp "Continue? [y/n]: " -e CONTINUE
                done
                if [[ "$CONTINUE" = "n" ]]; then
                    exit 1
                fi
            fi
        fi
    elif [[ -e /etc/system-release ]]; then
        source /etc/os-release
        if [[ "$ID" = "centos" ]]; then
            OS="centos"
            if [[ ! $VERSION_ID == "7" ]]; then
                echo "Your version of CentOS is not supported."
                echo ""
                echo "The script only support CentOS 7."
                echo ""
                exit 1
            fi
        fi
        if [[ "$ID" = "amzn" ]]; then
            OS="amzn"
            if [[ ! $VERSION_ID == "2" ]]; then
                echo "Your version of Amazon Linux is not supported."
                echo ""
                echo "The script only support Amazon Linux 2."
                echo ""
                exit 1
            fi
        fi
    elif [[ -e /etc/fedora-release ]]; then
        OS=fedora
    elif [[ -e /etc/arch-release ]]; then
        OS=arch
    else
        echo "Looks like you aren't running this installer on a Debian, Ubuntu, Fedora, CentOS, Amazon Linux 2 or Arch Linux system"
        exit 1
    fi
}
```
**Descripción**: Determina el sistema operativo del host verificando la existencia de archivos específicos en /etc/ y estableciendo la variable OS en consecuencia. También verifica si la versión del sistema operativo es compatible.


### installQuestions() -- port

```bash
function installQuestions () {
	echo "Welcome to the OpenVPN installer!"
   echo ""
	echo "What port do you want OpenVPN to listen to?"
	echo "   1) Default: 1194"
	echo "   2) Custom"
	echo "   3) Random [49152-65535]"
	until [[ "$PORT_CHOICE" =~ ^[1-3]$ ]]; do
		read -rp "Port choice [1-3]: " -e -i 1 PORT_CHOICE
	done
	case $PORT_CHOICE in
		1)
			PORT="1194"
		;;
		2)
			until [[ "$PORT" =~ ^[0-9]+$ ]] && [ "$PORT" -ge 1 ] && [ "$PORT" -le 65535 ]; do
				read -rp "Custom port [1-65535]: " -e -i 1194 PORT
			done
		;;
		3)
			# Generate random number within private ports range
			PORT=$(shuf -i49152-65535 -n1)
			echo "Random Port: $PORT"
		;;
	esac
```
**Descripción**: Es la función más larga del script. Por lo que la dividiré en varias partes. La función realiza una serie de preguntas al usuario para configurar OpenVPN. Pide la dirección IPv4, el puerto, el protocolo (UDP/TCP), los servidores DNS, y la compresión de datos. En este caso preguna sobre el puerto a utilizar. En mi caso, he decidido utilizar Cloudflare (opción 3) como el resolver DNS predeterminado, garantizando una configuración rápida y globalmente accesible para la VPN.


### Acceso al script completo

Soy consciente de que el script es extenso y puede resultar abrumador a primera vista. Por esta razón, he decidido hacer público el script completo para aquellos que deseen explorar cada aspecto técnico en profundidad. El script completo, con comentarios para facilitar su comprensión, está disponible en el siguiente enlace:

[https://raw.githubusercontent.com/minfantem/terraform-TFG/main/scripts/openvpn-install.sh](https://raw.githubusercontent.com/minfantem/terraform-TFG/main/scripts/openvpn-install.sh)


La implementación de esta VPN personalizada con OpenVPN en una instancia EC2 ha sido un proyecto desafiante y enriquecedor, que ha reforzado mi comprensión de las redes virtuales y la seguridad en la nube.


# 8. Instrucciones de uso 

Como estudiante de ASIR y creador de este proyecto TFG, he compilado una guía que no solo facilitará el uso y la gestión de la VPN configurada con OpenVPN, sino que también servirá como documento de referencia para cualquier persona que acceda a este repositorio.

Este repositorio de GitHub ha sido diseñado para ser un punto de acceso fácil a los scripts necesarios para el proyecto y, al mismo tiempo, un espacio de trabajo futuro para colaborar en este proyecto o en cualquier otro que pueda surgir.

## 8.1 Configuración inicial

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

<br>

## 8.2 Despliegue de recursos

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


<div style="display: block; margin: 0 auto; text-align: center;">
    <img src="./img/init.png" alt="init" width="90%" height="50%">
    <p class="centered-text">Figura 13. Inicialización de Terraform</p>
</div>



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




## 8.3 Inputs y outputs


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


<br><br><br>

### Outputs

| Name               | Description                                                                                     |
|--------------------|-------------------------------------------------------------------------------------------------|
| **ec2_instance_dns** | El DNS público de la instancia EC2 asociada a la dirección IP elástica de OpenVPN.              |
| **ec2_instance_ip**  | La dirección IP pública de la instancia EC2 asociada a la dirección IP elástica de OpenVPN.     |
| **connection_string**| La cadena de conexión para SSH que utiliza la clave privada SSH y el usuario de la instancia EC2.|
| **ec2_instance_id**  | El identificador único de la instancia EC2 de OpenVPN.                                          |


<br><br><br><br><br><br><br>


## 8.4 Prueba de conectividad VPN

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


## 8.5 Eliminación de la infraestructura


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




## 8.6 Control de instancias EC2 mediante scripting 

Como el creador de este proyecto, he implementado un script llamado _"start_stop_ec2.sh"_ que ofrece una gran ventaja en la gestión de costos de AWS, ya que permite apagar o encender la instancia EC2 según sea necesario. Esto es especialmente útil porque la instancia EC2 es el componente que genera costos reales dentro de nuestra infraestructura.

### Uso del script _start_stop_EC2_

El script proporciona un menú interactivo que facilita el control de la instancia EC2. Aquí está el proceso detallado:

1. **Detener la instancia**: Si necesitas detener la instancia para evitar cargos innecesarios, el script ejecutará la función _stop_instance_, que detendrá la instancia especificada.

2. **Iniciar la instancia**: Cuando estés listo para trabajar nuevamente, el script ejecutará la función _start_instance_, que iniciará la instancia previamente detenida.

<br>

### Ventajas

- **Control de costos**: Solo pagas por lo que usas. Al detener la instancia cuando no está en uso, reduces los costos operativos.
- **Facilidad de uso**: El menú interactivo simplifica el proceso de controlar el estado de la instancia EC2 sin tener que navegar por la consola de AWS.
- **Automatización**: Con este script, puedes automatizar el proceso de encendido y apagado, integrándolo en tus flujos de trabajo de desarrollo o producción.


<div style="display: block; margin: 0 auto; text-align: center;">
    <img src="./img/start_stop.png" alt="start_stop" width="70%" height="50%">
    <p class="centered-text">Figura 14. Resultados de la ejecución de start_stop_ec2.sh</p>
</div>


   Revisamos en la consola web de AWS que la instancia cambia de estado y se está deteniendo. Recuerda que para ejecutar este script necesitarás tener configuradas tus credenciales de [AWS CLI](#42-aws-cli) y permisos adecuados para las acciones sobre las instancias EC2.


<div style="display: block; margin: 0 auto; text-align: center;">
    <img src="./img/stop.png" alt="stop" width="100%" height="50%">
    <p class="centered-text">Figura 15. Instancia deteniéndose en AWS</p>
</div>



Este script es un ejemplo claro de cómo la infraestructura como código no solo facilita la gestión de la infraestructura de TI, sino que también optimiza los costos asociados a ella.

<br><br>


# 9. Optimización de costes

Para este proyecto he incorporado herramientas de análisis de costos como Infracost, que me han permitido tener una visión clara y detallada del gasto asociado a la infraestructura desplegada en AWS. A continuación, detallo cómo he utilizado estas herramientas para optimizar los costos y mejorar la eficiencia del proyecto.

## 9.1 Análisis de costos y eficiencia

El análisis de costos es fundamental para cualquier proyecto en la nube. Con **Infracost**, he podido desglosar los costos por servicio y prever el gasto mensual basado en la configuración actual de la infraestructura. Este análisis me ha permitido identificar áreas donde se pueden reducir costos sin comprometer el rendimiento.

<div style="display: block; margin: 0 auto; text-align: center;">
    <img src="./img/infracost.png" alt="infracost" width="90%" height="50%">
    <p class="centered-text">Figura 16. Análisis del costo mensual del proyecto</p>
</div>

<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>




## 9.2 Optimización de recursos

La capacidad de controlar el encendido y apagado de la instancia EC2 a través de scripts es una de las optimizaciones más efectivas que he implementado en este proyecto. Dado que la instancia EC2 es el recurso que incurre en gastos reales dentro de nuestra infraestructura, gestionar su operatividad de manera precisa nos permite una optimización significativa de costos.


### Estimación de gastos con uso controlado

Utilizando una instancia EC2 t2.micro y asumiendo un uso promedio de 2 horas al día durante un mes, podemos estimar el gasto de la siguiente manera:

- Costo aproximado por hora de una instancia t2.micro: $0.0116/hora.
- Horas de uso al mes: 2 horas/día * 30 días = 60 horas/mes.
- Estimación de gasto mensual: 60 horas/mes * $0.0116/hora = $0.696.

Por lo tanto, al gestionar activamente la instancia EC2 y limitar su funcionamiento a solo 2 horas diarias, el costo estimado sería de aproximadamente **$0.696** al mes. Esto representa una optimización significativa en comparación con el costo de $11 que implicaría mantener la instancia operativa continuamente.

Esta metodología demuestra cómo una gestión efectiva y consciente de los recursos puede resultar en ahorros sustanciales, especialmente en proyectos que requieren flexibilidad en el uso de la infraestructura en la nube.


# 10. Futuro y caminos por explorar



## 10.1 Lista de mejoras

Reflexionando sobre el futuro del proyecto y las posibles mejoras para una versión 2, he identificado varias áreas clave que podrían enriquecer significativamente la infraestructura:

1. **Expansión de la compatibilidad multiplataforma**: Ampliar la compatibilidad para incluir otros proveedores de servicios en la nube, lo que permitiría una mayor flexibilidad y adaptabilidad a diferentes entornos y necesidades empresariales.
1. **Mejoras en la automatización y la orquestación**: Integrar herramientas adicionales de CI/CD para automatizar aún más el proceso de despliegue y actualización de la infraestructura, mejorando la eficiencia y reduciendo el margen de error humano.
1. **Refuerzo de la seguridad**: Implementar políticas de seguridad más estrictas y mecanismos de detección de intrusiones para garantizar que la infraestructura sea resistente a amenazas y vulnerabilidades emergentes.

1. **Monitorización con Zabbix**: Desarrollar una integración con Zabbix para proporcionar una monitorización avanzada de la infraestructura, permitiendo una visión detallada del rendimiento y la salud del sistema en tiempo real.

<br><br>


## 10.2 Terraform Cloud: Preparando el terreno para la colaboración futura

En esta sección, exploraremos las ventajas y oportunidades que ofrece Terraform Cloud en el contexto de colaboración y gestión de infraestructuras como código.

Terraform Cloud registra cambios en el código y permite agregar comentarios, facilitando el seguimiento de modificaciones y la colaboración entre miembros del equipo con un **control de versiones avanzado**. Esta característica es esencial para mantener un historial claro y detallado de las alteraciones realizadas, promoviendo una mejor comunicación y entendimiento entre los colaboradores.

<div style="display: block; margin: 0 auto; text-align: center;">
    <img src="./img/workspaces.png" alt="infracost" width="100%" height="50%">
    <p class="centered-text">Figura 17. Captura de pantalla del panel de Workspaces en Terraform Cloud.</p>
</div>


Cuando se combina con un repositorio de GitHub, Terraform Cloud se presenta como una solución robusta para equipos que desean trabajar conjuntamente en la definición y despliegue de infraestructuras. Su capacidad para centralizar y gestionar el estado de la infraestructura (_**.tfstate**_) en un entorno compartido permite la colaboración sin comprometer la consistencia ni la integridad de los recursos desplegados. La gestión centralizada del estado asegura que todos los miembros del equipo trabajen con la misma información actualizada, evitando conflictos y errores comunes en la gestión descentralizada de infraestructuras.


<div style="display: block; margin: 0 auto; text-align: center;">
    <img src="./img/Overview.png" alt="infracost" width="100%" height="50%">
    <p class="centered-text">Figura 18. Captura de pantalla de la vista general (Overview) en Terraform Cloud.</p>
</div>

Finalmente, Terraform Cloud promueve una **colaboración transparente**, donde varios miembros del equipo pueden acceder al mismo workspace. La visualización del estado compartido y las opciones para colaborar en la definición de recursos son esenciales para un flujo de trabajo eficiente. Esta transparencia no solo mejora la eficiencia, sino que también facilita la identificación y resolución de problemas en las etapas tempranas del desarrollo, asegurando una implementación más rápida y confiable de las infraestructuras.


<div style="display: block; margin: 0 auto; text-align: center;">
    <img src="./img/versiones.png" alt="infracost" width="100%" height="50%">
    <p class="centered-text">Figura 19. Captura de pantalla del panel de Runs en Terraform Cloud.</p>
</div>

<br><br><br><br><br><br><br><br><br><br><br><br>


# 11. Resultados y conclusiones

## Reflexiones finales

### ¿De qué me ha servido el proyecto?

Este proyecto ha sido una oportunidad invaluable para desarrollar habilidades prácticas en la automatización de infraestructuras en la nube. Me ha permitido comprender mejor las complejidades de AWS y cómo Terraform puede simplificar la gestión de recursos. Además, me ha enseñado la importancia del control de costos y la eficiencia operativa en un entorno de nube.

### ¿Es viable su uso?

Definitivamente, el uso de Terraform para desplegar y gestionar infraestructuras en la nube es viable y recomendable. La capacidad de codificar la infraestructura y utilizar scripts para controlar los recursos ofrece una flexibilidad y escalabilidad que son esenciales en la industria actual de TI.

### ¿Tiene una aplicación práctica real?

Sí, el proyecto tiene aplicaciones prácticas reales. La infraestructura que he creado puede ser utilizada por organizaciones para establecer sus propias VPNs, mejorar la seguridad de la transmisión de datos y optimizar la gestión de sus sistemas en la nube. También es aplicable para uso doméstico como VPN personal.

### Publicación en GitHub

Aunque no publicaré este proyecto en un market, tengo la intención de compartirlo en GitHub. Esto no solo permitirá que otros se beneficien y aprendan de mi trabajo, sino que también me brindará la oportunidad de colaborar con la comunidad y mejorar el proyecto con sus aportes. El repositorio ya está disponible y se puede acceder a él a través del siguiente enlace:
[https://github.com/minfantem/terraform-TFG](https://github.com/minfantem/terraform-TFG)


### Conclusiones personales

Reflexionando sobre el trabajo realizado, puedo reafirmar lo que ya sospechaba: el ámbito de la computación en la nube es vasto y complejo. A pesar de haber dedicado incontables horas y sentir que he adquirido un conocimiento considerable, todavía me percibo al borde de un océano de información por descubrir.

La barrera del conocimiento inicial es notablemente alta. Al adentrarme en AWS por primera vez, me vi rodeado de innumerables paneles, servicios, opciones y configuraciones que pueden ser abrumadoras, especialmente cuando se enfrenta un proyecto individual como el TFG.

Aprender y comprender cómo desplegar infraestructura con AWS ha sido un desafío fascinante y atractivo. No obstante, también he experimentado momentos de frustración cuando el progreso parecía estancarse y el camino a seguir no estaba claro. A pesar de estos obstáculos, considero la experiencia enormemente enriquecedora y valiosa. A continuación, presento un resumen de los logros alcanzados, las limitaciones y desafíos enfrentados, y mis recomendaciones para futuras investigaciones.

<br><br>

## 11.1 Logros alcanzados

- **Automatización completa**: He logrado automatizar completamente el despliegue de una infraestructura de VPN utilizando Terraform, lo que ha simplificado significativamente el proceso de gestión de la infraestructura en la nube.
- **Control de costos**: Implementé scripts que permiten un control eficiente de la instancia EC2, ofreciendo la posibilidad de apagarla o encenderla según sea necesario, lo cual es crucial para la optimización de costos.

- **Documentación exhaustiva**: He creado una documentación detallada y accesible que facilita la comprensión y el uso de la infraestructura por parte de otros usuarios o desarrolladores.

## 11.2 Limitaciones y desafíos enfrentados

- **Curva de aprendizaje**: A pesar de la potencia de Terraform, existe una curva de aprendizaje inicial para entender y utilizar todas sus capacidades.

- **Dependencia de servicios de AWS**: La infraestructura depende en gran medida de los servicios específicos de AWS, lo que podría limitar su portabilidad a otros proveedores de nube sin una adaptación adecuada.

## 11.3 Recomendaciones para futuras investigaciones

- **Exploración de proveedores alternativos**: Sería beneficioso investigar cómo se pueden adaptar los scripts y módulos de Terraform para ser utilizados con otros proveedores de servicios en la nube, aumentando así la flexibilidad del proyecto.
- **Optimización del tiempo de despliegue**: Recomiendo investigar métodos para acelerar el proceso de creación y eliminación de recursos, posiblemente a través de la implementación de mejores prácticas de Terraform o el uso de herramientas adicionales.

- **Seguridad mejorada**: Aunque se han implementado prácticas de seguridad, siempre hay espacio para mejorar. Futuras investigaciones podrían centrarse en fortalecer la seguridad de la infraestructura, especialmente en lo que respecta a la gestión de credenciales y la comunicación entre servicios.

<br><br><br><br><br><br><br><br><br><br><br><br>

# 12. Bibliografía


[1] [Mariusz Michalowski, "What is Terraform? What is it Used For, How it Works,"](https://spacelift.io/blog/what-is-terraform) *Spacelift*, 8 de abril de 2024.

[2] [S. Hernandez y Y. Huang, "Terraform stacks, explained"](https://www.hashicorp.com/blog/terraform-stacks-explained), *HashiCorp*, 27 de noviembre de 2023.

[3] [Deepak Kumar Sharma, "Terraform Beginner’s Guide: Everything You Should Know"](https://k21academy.com/terraform-iac/terraform-beginners-guide/), *K21Academy*, 5 de febrero de 2024.

[4] [Zero To Mastery, "What is Terraform? | Terraform Explained"](https://www.youtube.com/watch?v=lIaUz2GAqEQ), *YouTube*, 2 de marzo de 2023.

[5] [Zeal Vora, "Ultimate Guide to Terraform: From Beginner to Expert"](https://www.zero2devops.com/blog/ultimate-guide-to-terraform), *Zero to Devops*, 7 de octubre.

[6] [Fresh Consulting, "Using Terraform to Overcome Critical Cloud Challenges"](https://www.freshconsulting.com/insights/blog/using-terraform-to-overcome-critical-cloud-challenges/), *Fresh Consulting Insights*, 7 de junio de 2023.

[7] [HashiCorp, "Multi-cloud provisioning - Terraform by HashiCorp"](https://www.terraform.io/docs/index.html), *Terraform Official Documentation*.

[8] [J. Doe, "Security in AWS: An In-Depth Guide"](https://docs.aws.amazon.com/security/), *AWS Security*, 15 de marzo de 2024.

[9] [OpenVPN, "How To"](https://openvpn.net/community-resources/how-to/), *OpenVPN Community Resources*, 22 de abril de 2023

<br>

## Agradecimientos

Quisiera expresar mi más sincero agradecimiento al profesor José Miguel Robles, cuya presentación e introducción a Terraform abrió ante mí un mundo de posibilidades. Su pasión por esta herramienta y su potencial fue lo que inspiró la elección de mi Trabajo de Fin de Grado. Gracias a su enseñanza durante el primer año, pude comprender la profundidad y la capacidad de Terraform, lo que me motivó a explorar más a fondo este tema.

Además, estoy profundamente agradecido por la paciencia y dedicación que ha mostrado hacia mí. Su disposición para resolver cualquier duda y proporcionar orientación ha sido invaluable en mi viaje académico. Su apoyo constante ha sido un pilar fundamental para mi desarrollo y progreso en este proyecto.

De nuevo, mi más profundo agradecimiento por su mentoría, conocimiento y tiempo.


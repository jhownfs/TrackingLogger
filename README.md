# TrackingLogger
Projeto para monitoramento de execuções Salesforce.

O Objetivo é poder monitorar a execução das classes e seus limites para fiz de melhorias e decisões arquiteturiais.

As classes de testes ainda não estão construídas, mas estão sendo preparadas.

# Desing Pattern

É utilizado um pattern de desenvolvimento em camadas, onde cada camada tem a sua responsabilidade bem definida e trabalhada.

# Recursos Salesforce

Também é utilizado o Plaform Events, que registram os logs por serem assincronos e não pararem mesmo que haja um exceção na execução atual.

Utilizamos o Big Data para armazenar registros históricos e que serão recuperados para consulta via componente.

Projeto está em fase inicial e em teste beta.

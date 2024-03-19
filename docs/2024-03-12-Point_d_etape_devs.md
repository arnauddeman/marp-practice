---
marp: true
theme: gaia
paginate: true
avenirs-toc: Point d'étape développements
_class:
  - invert
  - lead
header: ""
footer: '![height:80px](https://avenirs-esr.github.io/dev-doc/assets/images/avenir-esr-logo_medium.jpg) ![height:80px](https://www.esup-portail.org/sites/default/files/logo-esupportail_1.png)'
style: |
  section::after {
    left: 0;
    right: 0;
    text-align: center;
  }
---

<style>
  :root {
    #--color-background: #ddd;
    #--color-background-code: #ccc;
    --color-background-paginate: rgba(128, 128, 128, 0.05);
    #--color-foreground: #345;
    --color-highlight: #f96;
    --color-highlight-hover: #aaf;
    --color-highlight-heading: #99c;
    --color-header: #fff;
    --color-header-shadow: transparent;
  }
  footer {
    height: 100px;
    display:grid;
    grid-template-columns: repeat(2, 1fr);
    grid-template-rows:100%;
  }
  footer img:nth-of-type(2) {
    grid-column: 4;
    background-color: #fff;
  }
</style>

## Point développements

***12/03/2024***
Julien Gribonvald - Coordinateur Technique ESUP
Arnaud Deman - Architecte et développeur ESUP

<!--ts-->
   
<!--te-->

---

## Du contexte à l'environnement de dev

* Re-développement d'un outil existant où toutes les bases/briques de l'architecture sont à revoir
  * Pour l'instant plus une vision de ce vers quoi nous allons
  * Des Spécifications fonctionnelles à définir par rapport aux différents retours et expérimentations
  * Une intégration dans un périmètre avec plusieurs partenaires (SCO, Monde du Travail, Pégase, Europass, partenaires privés)

---
<!--
header: Du contexte à l'environnement de dev
-->

* Définition des briques/modules nécessaires

<style scoped type="text/css">
  img[alt="Schema modules"] {
    width: 525px;
    margin-left: auto;
    margin-right: auto;
    display: block;
  }
</style>

![Schema modules](https://avenirs-esr.github.io/dev-doc/assets/images/building-blocks.svg)

---

* Définition d'un environnement de développement commun et facile à déployer
  * ensemble de services (mariadb, openldap, API Manager, CAS, etc...)
  * des technos (java, spring, nodejs, javascript, Lit (web-component))
  * un environnement commun (docker)
  * des pratiques communes / documentées (site/docs via github-pages)

---

* Des expérimentations / tests de mises en place
  * Comparatif des API-Manager (propriétaires et libres) avec coûts, pour et contre
  * Authentification avec OIDC de bout en bout (via API-Manager + CAS => un POC UI/API)
  * Brokers pour la gestion de notifications (apache kafka), et la gestion d'évènements asynchrones

---

![Schema etat](https://avenirs-esr.github.io/dev-doc/assets/images/arch.svg)

<style scoped>
  img[alt="Schema etat"] {
    width: 500px;
    margin-left: auto;
    margin-right: auto;
    display: block;
  }
</style>

---
<!--
header: ''
-->
## Perspectives

* Travail sur l'UI/UX
  * définir les premiers écrans et interfaces à réaliser
  * besoin des aspects fonctionnels principaux APC et projet de vie
* Gestion du stockage
  * Groupe de travail conformité et sécurité des données
  * Cycle de vie des données
  * Gestion de versions et indexation

---
<!--
header: Perspectives
-->
* Supervision de la plateforme
  * Monitoring
  * Pilotage
  * Analyse usages
  * Learning Analytics

---
<!--
header: Ressources
-->
 [Pour tout savoir](https://avenirs-esr.github.io/dev-doc/)

https://avenirs-esr.github.io/dev-doc/

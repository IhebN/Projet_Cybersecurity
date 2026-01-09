# Exercice 2 – Mise en place d’Active Directory avec PowerShell

## Objectif
L’objectif de cet exercice est de mettre en place un domaine Active Directory
et d’automatiser la création des utilisateurs et des groupes à l’aide de
scripts PowerShell.

Le domaine créé est :
laplateforme.io

---

## Environnement utilisé
- Windows Server 2019
- Rôle Active Directory Domain Services (AD DS)
- PowerShell
- Fichier CSV pour l’importation des utilisateurs

---

## Étapes réalisées

### 1. Installation du rôle Active Directory
- Installation du rôle **Active Directory Domain Services**.
- Promotion du serveur en **contrôleur de domaine**.
- Création d’une nouvelle forêt :
  - Nom de domaine : laplateforme.io

### 2. Préparation des données
- Création d’un fichier CSV contenant :
  - nom
  - prénom
  - groupes d’appartenance

### 3. Création des groupes
- Les groupes sont créés automatiquement dans Active Directory :
  - Animation
  - AS
  - Médical
  - Hébergement
  - Cadres
  - Administratif
  - Technique

### 4. Création des utilisateurs
- Importation des utilisateurs depuis le fichier CSV.
- Création automatique des comptes utilisateurs.
- Ajout des utilisateurs dans leurs groupes respectifs.

### 5. Gestion des mots de passe
- Tous les utilisateurs reçoivent le mot de passe par défaut :
  Azerty_2025!
- Le changement du mot de passe est forcé à la première connexion.

---

## Vérifications
- Vérification de la présence des utilisateurs dans :
  Active Directory Users and Computers.
- Vérification de l’appartenance aux groupes.
- Test de connexion avec un compte utilisateur.

---


## Résultat
Le domaine Active Directory est opérationnel.
Les utilisateurs et les groupes ont été créés automatiquement
à partir du fichier CSV et les règles de mot de passe sont appliquées.

Le domaine Active Directory est opérationnel.
Les utilisateurs et les groupes ont été créés automatiquement
à partir du fichier CSV et les règles de mot de passe sont appliquées.

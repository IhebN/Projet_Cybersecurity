# Exercice 1 – Mise en place d’un réseau VLAN

## Objectif
Mettre en place un réseau d’entreprise avec :
- segmentation par VLAN,
- liaisons trunk entre les équipements,
- routage inter-VLAN,
- service DHCP,
- connectivité Wi-Fi.

Le but est de permettre la communication entre les différents réseaux
tout en gardant une organisation claire du trafic.

---

## Environnement
- Cisco Packet Tracer
- 1 routeur Cisco 1941
- 3 switches
- 3 points d’accès Wi-Fi
- PC fixes, PC portables, téléphones IP

---

## Architecture du réseau
Chaque bureau contient :
- 2 PC fixes,
- 1 PC portable connecté en Wi-Fi,
- 1 téléphone IP,
- 1 point d’accès,
- 1 switch.

Les switches sont reliés entre eux en **trunk**.  
Le routeur est connecté au switch principal en **trunk** afin d’assurer
le **routage inter-VLAN** (Router-on-a-Stick).

---

## VLAN et plan d’adressage

| VLAN | Usage            | Réseau              |
|------|------------------|---------------------|
| 1    | Téléphonie VoIP  | 192.168.0.0/24      |
| 10   | Wi-Fi            | 192.168.10.0/24     |
| 20   | PC fixes         | 192.168.20.0/24     |
| 30   | Administration   | 192.168.30.0/24     |

La passerelle de chaque VLAN est configurée sur le routeur avec l’adresse x.x.x.1.

---

## Étapes de réalisation

### 1. Câblage
- Les postes, téléphones et points d’accès sont connectés sur des ports **access**.
- Les liaisons entre switches sont configurées en **trunk**.
- La liaison routeur–switch est configurée en **trunk**.

### 2. Configuration des switches
- Création des VLAN 10, 20 et 30.
- Affectation des ports :
  - Téléphones → VLAN 1
  - Points d’accès → VLAN 10
  - PC fixes → VLAN 20
  - Administration → VLAN 30
- Configuration des ports trunk entre les switches.

### 3. Configuration du routeur
- Mise en place du **Router-on-a-Stick** avec des sous-interfaces :
  - G0/0.1  → VLAN 1
  - G0/0.10 → VLAN 10
  - G0/0.20 → VLAN 20
  - G0/0.30 → VLAN 30
- Configuration du service **DHCP** pour chaque VLAN.

### 4. Tests
- Vérification de l’attribution automatique des adresses IP.
- Test de connectivité avec des commandes **ping**.
- Test de communication inter-VLAN.
- Test de la connexion Wi-Fi.

---

## Résultat
Le réseau est entièrement fonctionnel :
- Tous les équipements reçoivent une adresse IP automatiquement.
- Les VLAN sont correctement segmentés.
- Les liaisons trunk assurent la circulation des VLAN.
- Le routage inter-VLAN permet la communication entre les réseaux.
- Le Wi-Fi fonctionne dans chaque bureau.

\# TP02 - Infrastructure as Code \& Orchestration Ansible



Ce dépôt contient les livrables du TP02 axés sur le déploiement automatisé d'infrastructures avec \*\*OpenTofu\*\* et l'orchestration de configuration via \*\*Ansible\*\*.



\## 🚀 Architecture Déployée

L'infrastructure comprend trois instances Linux Ubuntu (24.04 LTS) orchestrées par Multipass :

\* \*\*bastion\*\* : Nœud de contrôle détenant la clé privée du lab, équipé d'Ansible.

\* \*\*app\*\* : Serveur applicatif cible (sécurisé via clé publique).

\* \*\*monitor\*\* : Serveur de supervision cible (sécurisé via clé publique).



\## 🛠️ Spécificités du Déploiement (Windows 11)

Afin d'assurer une compatibilité totale avec l'environnement hôte \*\*Windows 11\*\* et de contourner les limitations de baux DHCP/Timeout liés à l'hyperviseur, les adaptations cyber suivantes ont été appliquées avec succès :

1\. \*\*Optimisation Cloud-Init\*\* : Allègement initial des manifests pour garantir l'instanciation des VMs sans interruption réseau.

2\. \*\*Gestion des Secrets\*\* : Isolation stricte du dossier contenant les clés SSH privées (`keys/`) via un fichier `.gitignore` audité.

3\. \*\*Routage Ansible\*\* : Configuration d'un inventaire Ansible (`hosts`) exploitant les hôtes locaux pour mapper les cibles partagées en mode NAT.



\## 📊 Validation des Livrables

La connectivité de bout en bout et l'authentification par paire de clés ont été validées depuis le bastion via le module de ping global d'Ansible :



```bash

ansible all -m ping -i hosts

```

\*Résultat obtenu :\* \*\*`"ping": "pong"`\*\* (Statut `SUCCESS` sur l'ensemble des nœuds cibles).



\## 📁 Structure du Rendu

Conformément aux exigences du sujet, l'arborescence des livrables est organisée comme suit :

\* `livrables/opentofu/main.tf` : Code d'orchestration HCL complet.

\* `livrables/cloud-init/bastion.yaml` : Profil du nœud de contrôle.

\* `livrables/cloud-init/node.yaml` : Profil générique des machines cibles.




# Installation de l'add-on Ygégé pour Home Assistant

## Prérequis

1. **Compte YGG Torrent actif** - Vous devez avoir un compte valide sur YGG Torrent
2. **Identifiants YGG** - Votre nom d'utilisateur et mot de passe
3. **Home Assistant** - Version compatible avec les add-ons personnalisés
4. **Architecture** - Système amd64 uniquement

## Étapes d'installation

### 1. Ajouter le dépôt à Home Assistant

1. Ouvrez Home Assistant
2. Allez dans **Paramètres** → **Modules complémentaires**
3. Cliquez sur **Boutique des modules complémentaires** (coin inférieur droit)
4. Cliquez sur les **trois points** (coin supérieur droit) → **Dépôts**
5. Ajoutez l'URL du dépôt : `https://github.com/BenjaminBR/my-hassio-addons`
6. Cliquez sur **Ajouter**

### 2. Installer l'add-on Ygégé

1. Retournez à la Boutique des modules complémentaires
2. Recherchez **"Ygégé"** dans la liste
3. Cliquez sur l'add-on Ygégé
4. Cliquez sur **Installer**
5. Attendez la fin de l'installation (téléchargement de l'image Docker)

### 3. Configuration

Avant de démarrer l'add-on, configurez-le :

1. Allez dans l'onglet **Configuration**
2. Renseignez vos identifiants YGG :
   ```yaml
   ygg_username: "votre_nom_utilisateur"
   ygg_password: "votre_mot_de_passe"
   ```
3. (Optionnel) Ajustez les autres paramètres :
   ```yaml
   log_level: info          # debug, info, warning, error
   imdb_enabled: true       # Métadonnées IMDB
   tmdb_enabled: true       # Métadonnées TMDB
   ```
4. Cliquez sur **Enregistrer**

### 4. Démarrer l'add-on

1. Allez dans l'onglet **Info**
2. Cliquez sur **Démarrer**
3. Attendez quelques secondes le démarrage
4. Vérifiez les **Journaux** pour confirmer que tout fonctionne

### 5. Accéder à l'interface Web

Une fois démarré, l'interface Web est accessible :

- **URL locale** : `http://homeassistant.local:8715`
- **URL IP** : `http://[IP_HOME_ASSISTANT]:8715`
- **Bouton WebUI** : Directement depuis l'add-on dans Home Assistant

## Configuration des identifiants

### Méthode recommandée : Interface Home Assistant

C'est la méthode la plus sûre car les identifiants sont stockés de manière sécurisée :

1. Dans l'add-on Ygégé, onglet **Configuration**
2. Renseignez :
   - `ygg_username`: Votre identifiant YGG
   - `ygg_password`: Votre mot de passe YGG
3. Sauvegardez et redémarrez l'add-on

### Vérification

Pour vérifier que l'authentification fonctionne :

1. Consultez les **Journaux** de l'add-on
2. Vous devriez voir des messages de connexion réussie
3. Accédez à l'interface Web et effectuez une recherche test

## Utilisation

### Recherche manuelle

1. Ouvrez l'interface Web : `http://homeassistant.local:8715`
2. Entrez votre requête de recherche
3. Parcourez les résultats avec métadonnées
4. Cliquez sur les torrents pour plus de détails

### Intégration API

L'API REST est disponible pour vos applications :

```bash
# Recherche
curl "http://homeassistant.local:8715/api/search?q=ubuntu"

# Détails d'un torrent
curl "http://homeassistant.local:8715/api/torrent/12345"

# Statut de santé
curl "http://homeassistant.local:8715/api/health"
```

### Intégration avec Prowlarr

Si vous utilisez Prowlarr, ajoutez Ygégé comme indexeur personnalisé :

1. Dans Prowlarr : **Paramètres** → **Indexeurs**
2. Ajoutez un nouvel indexeur : **Generic Newznab**
3. Configuration :
   - **Nom** : Ygégé
   - **URL** : `http://homeassistant.local:8715`
   - **Chemin API** : `/api/search`
4. Testez et sauvegardez

## Dépannage

### L'add-on ne démarre pas

**Symptôme** : L'add-on s'arrête immédiatement après le démarrage

**Solutions** :
1. Vérifiez que vos identifiants YGG sont corrects
2. Consultez les journaux pour les messages d'erreur
3. Assurez-vous que le port 8715 n'est pas utilisé
4. Vérifiez que votre système est amd64

### Impossible d'accéder à l'interface Web

**Symptôme** : La page ne charge pas sur le port 8715

**Solutions** :
1. Vérifiez que l'add-on est bien démarré
2. Essayez avec l'IP directe : `http://[IP]:8715`
3. Vérifiez les règles de pare-feu
4. Consultez les journaux de l'add-on

### Les recherches ne retournent rien

**Symptôme** : Pas de résultats de recherche

**Solutions** :
1. Vérifiez que votre compte YGG est actif
2. Testez l'accès à YGG depuis votre réseau
3. Consultez les journaux pour voir les erreurs de connexion
4. Attendez quelques minutes (bypass Cloudflare en cours)

### Erreurs d'authentification

**Symptôme** : Messages d'erreur liés aux identifiants

**Solutions** :
1. Revérifiez votre nom d'utilisateur YGG (sensible à la casse)
2. Revérifiez votre mot de passe
3. Assurez-vous que votre compte YGG n'est pas suspendu
4. Réinitialisez vos identifiants dans la configuration

## Mise à jour

Pour mettre à jour l'add-on :

1. Allez dans **Modules complémentaires**
2. Cliquez sur **Ygégé**
3. Si une mise à jour est disponible, un bouton **Mettre à jour** apparaît
4. Cliquez sur **Mettre à jour**
5. Attendez la fin du téléchargement
6. L'add-on redémarrera automatiquement

## Désinstallation

Pour supprimer l'add-on :

1. **Arrêtez** l'add-on d'abord
2. Cliquez sur **Désinstaller**
3. Confirmez la suppression
4. Les données de configuration seront également supprimées

## Support et documentation

- **Documentation complète** : Voir [README.md](README.md)
- **Projet Ygégé** : [https://github.com/UwUDev/ygege](https://github.com/UwUDev/ygege)
- **Documentation API** : `http://homeassistant.local:8715/api` (une fois démarré)
- **Historique des versions** : Voir [CHANGELOG.md](CHANGELOG.md)

## Avantages de Ygégé

✅ **Pas de FlareSolverr requis** - Bypass Cloudflare intégré
✅ **Recherche ultra-rapide** - Optimisé en Rust
✅ **Faible consommation** - ~15 MB de RAM seulement
✅ **Métadonnées riches** - IMDB et TMDB intégrés
✅ **Gestion automatique** - Domaines et sessions gérés automatiquement
✅ **API moderne** - REST API complète pour intégrations

## Comparaison avec d'autres solutions

| Fonctionnalité | Ygégé | Prowlarr | Jackett |
|----------------|-------|----------|---------|
| Bypass Cloudflare intégré | ✅ | ❌ | ❌ |
| Utilisation RAM | ~15 MB | ~150 MB | ~80 MB |
| Vitesse de recherche | Très rapide | Moyenne | Moyenne |
| Nombre d'indexeurs | YGG uniquement | Multiple | Multiple |
| Métadonnées IMDB/TMDB | ✅ | ❌ | ❌ |
| API REST moderne | ✅ | ✅ | ✅ |

**Recommandation** : Utilisez Ygégé en complément de Prowlarr pour une expérience YGG optimale, ou comme solution autonome si YGG est votre seul indexeur.

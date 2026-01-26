# TODO - Finalisation de l'add-on Ygégé

## ✅ Terminé

- [x] Structure de base de l'add-on créée
- [x] Fichier `config.yaml` avec configuration complète
- [x] `Dockerfile` basé sur l'image officielle uwucode/ygege
- [x] Documentation complète (`README.md`)
- [x] Guide d'installation (`INSTALLATION.md`)
- [x] Historique des versions (`CHANGELOG.md`)
- [x] Configuration des identifiants YGG sécurisés
- [x] Support IMDB et TMDB
- [x] Health check configuré
- [x] Port 8715 exposé

## ⚠️ À finaliser

### 1. Images/Logos (OBLIGATOIRE)

Vous devez ajouter deux fichiers image dans le répertoire `ygege/` :

- **`icon.png`** - Icône carrée 128x128 pixels
- **`logo.png`** - Logo rectangulaire 512x256 pixels

**Options pour obtenir les logos :**

#### Option A : Télécharger depuis GitHub (Recommandé)
Si le projet ygégé a des logos officiels sur GitHub, utilisez-les :
```bash
cd ygege/
# Télécharger icon.png et logo.png depuis le repo officiel
wget https://raw.githubusercontent.com/UwUDev/ygege/main/path/to/icon.png
wget https://raw.githubusercontent.com/UwUDev/ygege/main/path/to/logo.png
```

#### Option B : Créer vos propres logos
Utilisez un outil de design (Figma, Canva, GIMP, etc.) pour créer :
- Un logo avec le texte "Ygégé" ou "YGG"
- Style moderne, couleurs YGG (vert/noir typiquement)
- Format PNG avec transparence

#### Option C : Utiliser des placeholders temporaires
Pour tester rapidement sans logos définitifs :
```bash
cd ygege/
# Créer des placeholders colorés
convert -size 128x128 xc:green -pointsize 30 -fill white -gravity center -annotate +0+0 "YGG" icon.png
convert -size 512x256 xc:green -pointsize 60 -fill white -gravity center -annotate +0+0 "Ygégé" logo.png
```

### 2. Test de l'add-on

Avant de publier, testez l'installation :

```bash
# 1. Commit les changements
git add ygege/
git commit -m "Add Ygégé add-on for YGG Torrent indexing"

# 2. Push vers GitHub
git push origin main

# 3. Dans Home Assistant :
#    - Ajoutez le dépôt si ce n'est pas déjà fait
#    - Rafraîchissez la liste des add-ons
#    - Installez Ygégé
#    - Configurez avec vos identifiants YGG
#    - Démarrez et testez
```

### 3. Vérifications de fonctionnement

Une fois l'add-on installé et démarré :

- [ ] L'interface Web est accessible sur le port 8715
- [ ] Les journaux montrent une connexion réussie à YGG
- [ ] Une recherche test retourne des résultats
- [ ] L'API REST répond correctement
- [ ] Les métadonnées IMDB/TMDB s'affichent (si activées)
- [ ] Le bypass Cloudflare fonctionne automatiquement

### 4. Intégration Prowlarr (Optionnel)

Si vous utilisez Prowlarr, testez l'intégration :

- [ ] Ajout de Ygégé comme indexeur personnalisé
- [ ] Tests de recherche depuis Prowlarr
- [ ] Synchronisation avec Sonarr/Radarr

## 📋 Structure finale attendue

```
ygege/
├── CHANGELOG.md          ✅ Créé
├── config.yaml           ✅ Créé
├── Dockerfile            ✅ Créé
├── icon.png              ⚠️ À ajouter
├── INSTALLATION.md       ✅ Créé
├── logo.png              ⚠️ À ajouter
├── README.md             ✅ Créé
└── TODO.md               ✅ Ce fichier
```

## 🔍 Commandes de vérification

```bash
# Vérifier la structure
tree ygege/

# Vérifier la configuration YAML
yamllint ygege/config.yaml

# Vérifier le Dockerfile
docker build -t ygege-test ygege/

# Tester localement (avec Docker)
docker run -d \
  --name ygege-test \
  -p 8715:8715 \
  -e YGG_USERNAME="votre_user" \
  -e YGG_PASSWORD="votre_pass" \
  uwucode/ygege:latest
```

## 📚 Ressources

- **Projet Ygégé** : https://github.com/UwUDev/ygege
- **Documentation Docker** : https://ygege.lila.ws/installation/docker-guide
- **Image Docker officielle** : https://hub.docker.com/r/uwucode/ygege
- **Home Assistant Add-ons** : https://developers.home-assistant.io/docs/add-ons

## 🎯 Prochaines étapes recommandées

1. **Ajouter les logos** (icon.png et logo.png)
2. **Tester l'installation** dans Home Assistant
3. **Vérifier le fonctionnement** avec vos identifiants YGG réels
4. **Commit et push** vers GitHub
5. **Partager** avec la communauté si tout fonctionne

## 💡 Améliorations futures (optionnelles)

- Support multi-architecture (aarch64, armv7) si l'image officielle le supporte
- Options de configuration avancées (cache, timeouts)
- Intégration avec Home Assistant notifications
- Monitoring des statistiques de recherche
- Support de plusieurs comptes YGG
- Dashboard Home Assistant personnalisé

## ⚙️ Configuration avancée (post-installation)

### Variables d'environnement disponibles

L'image uwucode/ygege supporte ces variables :

- `YGG_USERNAME` - Nom d'utilisateur YGG (requis)
- `YGG_PASSWORD` - Mot de passe YGG (requis)
- `BIND_IP` - Adresse d'écoute (défaut: 0.0.0.0)
- `BIND_PORT` - Port d'écoute (défaut: 8715)
- `LOG_LEVEL` - Niveau de log (trace, debug, info, warn, error)

### Volumes persistants

L'add-on monte automatiquement :
- `/config` - Configuration persistante
- `/share` - Partage Home Assistant
- `/media` - Médias Home Assistant

## 🐛 Problèmes connus

- **Architecture** : Uniquement amd64 supporté (limitation de l'image Rust)
- **Logos manquants** : L'add-on apparaîtra sans icône tant que icon.png n'est pas ajouté
- **Premier démarrage** : Peut prendre 10-30 secondes pour le bypass Cloudflare initial

## ✉️ Support

Pour toute question :
1. Consultez d'abord `README.md` et `INSTALLATION.md`
2. Vérifiez les journaux de l'add-on dans Home Assistant
3. Consultez la documentation officielle Ygégé
4. Ouvrez une issue sur le dépôt GitHub si nécessaire

# Comment créer un morceau dans sonic pi uniquement à partir de samples externes
# Auteur : Nicolas Le Bellier - 08/09/2020
# pour le centre multimédia des Pieux https://centremultimedia.lespieux.fr
# Tous les samples durent 16 beats soit 4 mesures à 100 bpm
# version 01 sans voix.

use_bpm 100 # beats per minute

# A régler selon l'endroit où sont vos fichiers wav

chemin = "D:/audio/mesSamples/waves"

define :intro do
  # sonic pi va chercher le premier fichier
  # dont le nom de fichier contient "drum 1"
  sample chemin, "drum 1"
  sample chemin, "1 synth bass"
  sleep 16
end

define :couplet do
  sample chemin, "drum 1"
  sample chemin, "1 synth bass"
  sample chemin, "3 nylon"
  sleep 16
end

##| couplet
##| stop


define :couplet_B do
  sample chemin, "drum 2"
  sample chemin, "1 synth bass"
  sample chemin, "fx"
  sample chemin, "3 nylon"
  sleep 16
end

##| couplet_B
##| stop


define :refrain do
  sample chemin, "drum 6"
  sample chemin, "2 synth bass"
  sample chemin, "accords 3"
  sleep 16
end


##| refrain
##| stop


define :pont do
  sample chemin, "bass 3"
  sample chemin, "accords 2", pan: -1
  sample chemin, "arpeges", pan: 1
  sample chemin, "drum 8", finish: 0.75
  sleep 12
  sample chemin, "fill 5"
  sleep 4
end

##| pont
##| stop


define :outro do
  
  sample chemin, "1 synth bass"
  sample chemin, "2 nylon"
  
  sample chemin, "drum 5", finish: 0.75 # dure 0.75 * 16 = 12
  sleep 12
  sample chemin, "fill 2"
  sleep 4
  
end

##| outro
##| stop


# morceau complet avec sa structure
# un effet de reverb est appliqué à l'ensemble



intro

couplet
couplet_B

refrain

couplet_B

refrain

pont

refrain


outro


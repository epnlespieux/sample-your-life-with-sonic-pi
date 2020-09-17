# Comment créer un morceau dans sonic pi uniquement à partir de samples externes
# Auteur : Nicolas Le Bellier - 08/09/2020
# pour le centre multimédia des Pieux https://centremultimedia.lespieux.fr
# Tous les samples durent 16 beats soit 4 mesures à 100 bpm

use_bpm 100 # beats per minute

# A régler selon l'endroit où sont vos fichiers wav

chemin = "D:/audio/mesSamples/waves"

sample_free_all

define :intro do
  # sonic pi va chercher le premier fichier
  # dont le nom de fichier contient "drum 1"
  sample chemin, "drum 1"
  sample chemin, "1 synth bass"
  sleep 16
end

define :voix_couplet do
  4.times do
    # on peut aussi indiquer un chemin direct
    sample "D:/audio/mesSamples/waves/voix feminines.wav",
      slice: [4,2,4,8].tick,
      num_slices: 8,
      sustain: 2
    sleep 4
  end
end


define :couplet do
  sample chemin, "drum 1"
  sample chemin, "1 synth bass"
  sample chemin, "3 nylon"
  voix_couplet
end


##| couplet
##| stop


define :couplet_B do
  sample chemin, "drum 2"
  sample chemin, "1 synth bass"
  sample chemin, "fx"
  sample chemin, "3 nylon"
  voix_couplet
end

##| couplet_B
##| stop


define :voix_refrain do
  4.times do
    with_fx :echo, mix: 0.75, phase: 1 do
      sample chemin, "voix",
        finish: 0.5,
        slice: [1, 3].tick("voix"),
        num_slices: 12,
        attack: 0.3,
        sustain: 2,
        amp: 0.5
      sleep 4
    end
  end
end



define :refrain do
  sample chemin, "drum 6"
  sample chemin, "2 synth bass"
  sample chemin, "accords 3"
  voix_refrain
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
  
  with_fx :echo, cutoff: hz_to_midi(300), mix:0.5, pre_amp: 1, phase: 0.25 do
    sample chemin, "1 synth bass", finish: 0.02, sustain: 2
    sample chemin, "2 nylon", finish: 0.02 # dure 16
  end
end


##| outro
##| stop


# morceau complet avec sa structure
# un effet de reverb est appliqué à l'ensemble

with_fx :reverb do
  
  intro
  
  couplet
  couplet_B
  
  refrain
  
  couplet_B
  
  refrain
  
  pont
  
  refrain
  
  outro
  
end
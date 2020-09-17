# 03092020
# solution 02
#

# chaque partie dure 8 mesures donc 32 beats
# les samples font 16 beats donc 4 mesures on est sur du 4 beats par mesure 4/4

# intro
# couplet A
# couplet A' avec dernière mesure fill de batterie

# Refrain

# couplet B
# couplet B avec dernière mesure fill de batterie

# Refrain

# outro fill de batterie


##chemin = "D:/audio/mesSamples/100bpm-wav/"
chemin = "D:/audio/mesSamples/waves"


use_bpm 100

define :drums_A do
  # high pass filter filtre passe haut laisse passer les fréquences supérieures à la fréquence de coupure cutoff
  # dans sonicpi la valeur du cutoff correspond à une valeur midi.
  with_fx :lpf, cutoff: hz_to_midi(300), mix:0.5, pre_amp: 1.5 do
    in_thread do
      sample chemin, "drum 2",
        amp: 1.5
    end
  end
end

define :drums_B do
  with_fx :reverb, mix: 0.5, room: 0.5 do
    in_thread do
      sample chemin, "drum 2", beat_stretch: 16
    end
  end
end

define :drums_fill_A do
  with_fx :reverb, mix: 0.5, amp:2 do
    in_thread do
      sample chemin, "drum 3"
      sleep 12
      sample chemin, "fill 1"
      sleep 4
    end
  end
  
end

define :drums_fill_B do
  with_fx :reverb, mix: 0.5, amp:2 do
    in_thread do
      sample chemin, "drum 4"
      sleep 12
      sample chemin, "fill 5"
      sleep 4
    end
  end
  
end


define :bass_A do
  in_thread do
    sample chemin ,"2 synth bass",
      beat_stretch: 16,
      amp: 1.2
  end
end


define :bass_intro do
  in_thread do
    sample chemin ,"1-synth-bass",
      beat_stretch: 16,
      amp: 1.2
  end
end

define :bass_B do
  in_thread do
    sample chemin, "2 synth bass"
  end
end



define :nylon_A do
  in_thread do
    sample chemin,"4 nylon guitar",
      amp: 0.8
  end
end

define :nylon_B do
  in_thread do
    sample chemin, "2 nylon guitar",
      amp: 0.8
  end
end

define :accords_A do
  
  in_thread do
    sample chemin, "accords 1"
  end
  
end

define :synthe_B do
  
  in_thread do
    sample chemin, "accords 3"
  end
  
end


define :orgue do
  in_thread do
    sample chemin, "4 organ"
  end
end

define :arpege do
  in_thread do
    sample chemin, "arpeges 2"
  end
end



define :steel do
  in_thread do
    sample chemin, "steel"
  end
end

define :voix do
  in_thread do
    4.times do
      with_fx :echo, mix: 0.75, phase: 1.5 do
        sample "D:/audio/mesSamples/100bpm-looperman/looperman-l-2267968-0201717-u-k-r-a-p-t-y-p-e-v-o-c-a-l-s.wav",
          slice: [4, 2, 4, 6].tick, #rrand(1,8),
          num_slices: 8,
          attack: 0.3,
          sustain: 3,
          amp: 0.5
        sleep 4
      end
    end
  end
end



define :intro do
  1.times do
    drums_A
    bass_intro
    sleep 16
  end
end


# couplet A

define :couplet_A do
  
  2.times do
    drums_A
    bass_A
    accords_A
    nylon_A
    voix
    orgue
    sleep 16
  end
  
end

define :couplet_A_fill do
  
  drums_A
  bass_A
  accords_A
  nylon_A
  voix
  orgue
  sleep 16
  
  drums_fill_A
  bass_A
  synthe_A
  nylon_A
  voix
  orgue
  sleep 16
end

define :refrain do
  
  2.times do
    drums_A
    ##| bass_refrain
    synthe_B
    arpege
    sleep 16
  end
  
end


define :couplet_B do
  
  drums_B
  bass_B
  synthe_B
  steel
  sleep 16
  
  drums_fill_B
  bass_B
  synthe_B
  steel
  sleep 16
end


define :outro do
  
  sample chemin, "drum 5"
  bass_intro
  steel
  sleep 12
  sample chemin, "fill 3"
  2.times do
    sample :drum_splash_soft
    sleep 4
  end
  
  
end



###

# le morceau complet


outro

stop

intro


couplet_A
couplet_A_fill

refrain

couplet_B

refrain

outro
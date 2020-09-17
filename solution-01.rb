# 03092020
# solution 01
# rdv avec Fred.


use_bpm 100

define :drums_A do
  # high pass filter filtre passe haut laisse passer les fréquences supérieures à la fréquence de coupure cutoff
  # dans sonicpi la valeur du cutoff correspond à une valeur midi.
  with_fx :lpf, cutoff: hz_to_midi(500), mix:0.5, pre_amp: 1.5 do
    in_thread do
      sample "D:/audio/mesSamples/100bpm-wav/1-drums.wav",
        amp: 1.5
      ##| sample "D:/audio/fromAbleton/100bpm-organ.wav", beat_stretch: 16
    end
  end
end

define :drums_B do
  with_fx :reverb, mix: 0.5, room: 0.5 do
    in_thread do
      sample "D:/audio/mesSamples/boucles-100bpm/drum_2.wav", beat_stretch: 16
    end
  end
end

define :drums_fill_A do
  with_fx :reverb, mix: 0.5, amp:2 do
    in_thread do
      sample "D:/audio/mesSamples/boucles-100bpm/drum_2.wav"
      sleep 12
      sample "D:/audio/mesSamples/boucles-100bpm/fill_1.wav"
      sleep 4
    end
  end
  
end

define :drums_fill_B do
  with_fx :reverb, mix: 0.5, amp:2 do
    in_thread do
      sample "D:/audio/mesSamples/boucles-100bpm/drum_4.wav"
      sleep 12
      sample "D:/audio/mesSamples/boucles-100bpm/fill_5.wav"
      sleep 4
    end
  end
  
end


define :bass_A do
  in_thread do
    sample "D:/audio/mesSamples/100bpm-wav/1-synth-bass.wav",
      beat_stretch: 16,
      amp: 1.2
  end
end

define :bass_B do
  in_thread do
    sample "D:/audio/mesSamples/boucles-100bpm/2_synth_bass.wav"
  end
end



define :nylon_A do
  in_thread do
    sample "D:/audio/mesSamples/boucles-100bpm/4_nylon_guitar.wav",
      amp: 0.8
  end
end

define :nylon_B do
  in_thread do
    ##| sample "D:/audio/mesSamples/boucles-100bpm/2_nylon_guitar.wav",
    sample "D:/audio/fromAbleton/100bpm-organ.wav",
      
    amp: 0.8
  end
end



define :synthe_A do
  
  in_thread do
    sample "D:/audio/mesSamples/boucles-100bpm/accords_1.wav"
  end
  
end

define :synthe_B do
  
  in_thread do
    sample "D:/audio/mesSamples/boucles-100bpm/accords_4.wav"
  end
  
end


define :orgue do
  in_thread do
    sample "D:/audio/mesSamples/boucles-100bpm/4_organ.wav"
  end
end

define :riff do
  
  
  
end



define :steel do
  in_thread do
    sample "D:/audio/mesSamples/boucles-100bpm/", "steel"
  end
end

define :voix do
  in_thread do
    4.times do
      with_fx :echo, mix: 0.75, phase: 1.5 do
        sample "D:/audio/mesSamples/100bpm-looperman/looperman-l-2267968-0201717-u-k-r-a-p-t-y-p-e-v-o-c-a-l-s.wav",
          slice: [4, 2, 4, 6].tick, #rrand(1,8),
          num_slices: 8,
          attack: 0.1,
          ##| sustain: 3,
          amp: 0.5
        sleep 4
      end
    end
  end
end



###

# le morceau complet

2.times do
  drums_A
  bass_A
  sleep 16
end


# couplet A
3.times do
  drums_A
  bass_B
  synthe_A
  nylon_A
  voix
  sleep 16
end




# couplet A'
drums_fill_A
bass_A
synthe_A
nylon_A
orgue
voix
sleep 16

### B

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

### A
3.times do
  drums_A
  bass_A
  synthe_A
  nylon_A
  sleep 16
end


drums_fill_A
bass_A
nylon_A
sleep 16






function wave(_phase, _frequency, _waveform = WAVEFORM_FLAT)
{
    if (_frequency == 0.0) return 0.0;
    return _waveform.__toValue(_phase, _frequency);
}

//Library singleton
function __waveforms(){ static __instance = new (function() constructor 
{
    //Waveforms    
    __triangle = {
        toString:   function() { return "waveform triangle"; }, 
        __toValue:  function(_p, _f) { return (-2 / _f) * (_p - _f / 2 * floor((2 * _p)/ _f + 0.5)) * power(-1.0, floor((2 * _p)/ _f + 0.5)); } 
    };
    
    __sawtooth = { 
        toString:   function() { return "waveform sawtooth"; }, 
        __toValue:  function(_p, _f) { return -(_p / _f - floor(0.5 + _p / _f)); } 
    };
    
    __square = { 
        toString:   function() { return "waveform square"; }, 
        __toValue:  function(_p, _f) { return ((_p mod _f) < (_f / 2))? -0.5 : 0.5; } 
    };
    
    __sine = { 
        toString:   function() { return "waveform sine"; }, 
        __toValue:  function(_p, _f) { return sin(_p * (2*pi) / _f) / -2; } 
    };
    
    __flat = { 
        toString:   function() { return "waveform flat"; }, 
        __toValue:  function(_p, _f) { return 0.0 } 
    };
    
})(); return __instance; };

#macro WAVEFORM_TRIANGLE  (__waveforms()).__triangle
#macro WAVEFORM_SAWTOOTH  (__waveforms()).__sawtooth
#macro WAVEFORM_SQUARE    (__waveforms()).__square
#macro WAVEFORM_SINE      (__waveforms()).__sine
#macro WAVEFORM_FLAT      (__waveforms()).__flat

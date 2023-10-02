function wave(_phase, _frequency, _waveform = WAVEFORM_FLAT)
{
    if (_frequency == 0.0) return 0.0;
    return _waveform.[$ _waveform](_phase, _frequency);
}

//Library singleton
function __waveforms(){ static __instance = new (function() constructor 
{
    //Waveform factory
    var _set = function(_name, _function, _struct = self){ variable_struct_set(_struct, _name, _function) };

    //Waveforms    
    _set(WAVEFORM_TRIANGLE, function(_p, _f) { return (-2/_f) * (_p - _f/2*floor((2*_p)/ _f + 0.5)) * power(-1.0, floor((2*_p)/_f + 0.5)) });
    _set(WAVEFORM_SAWTOOTH, function(_p, _f) { return -(_p/_f - floor(0.5 + _p/_f)); });
    _set(WAVEFORM_SQUARE,   function(_p, _f) { return ((_p mod _f) < (_f/2))? -0.5 : 0.5 });
    _set(WAVEFORM_SINE,     function(_p, _f) { static __2pi = 2 * pi; return sin(_p*__2pi/_f)/-2 });
    _set(WAVEFORM_FLAT,     function(_p, _f) { return 0.0 });
    
})(); return __instance; };

#macro WAVEFORM_TRIANGLE  "waveform triangle"
#macro WAVEFORM_SAWTOOTH  "waveform sawtooth"
#macro WAVEFORM_SQUARE    "waveform square"
#macro WAVEFORM_SINE      "waveform sine"
#macro WAVEFORM_FLAT      "waveform flat"

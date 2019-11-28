from libcpp.string cimport string
from libcpp.vector cimport vector
from libcpp cimport bool


cdef extern from "sinsy.h" namespace "sinsy":
    ctypedef size_t SuddenDynamicsType
    ctypedef size_t GradualDynamicsType
    ctypedef size_t TieType
    ctypedef size_t SlurType
    ctypedef size_t SyllabicType
    ctypedef size_t ModeType

    cdef cppclass IScore:
        #! set encoding
        bool setEncoding(const  string& encoding)

        #! add key mark
        bool addKeyMark(ModeType modeType, int fifths)

        #! add beat mark (beats/beatType) to end of score: default beat mark is 4/4
        bool addBeatMark(size_t beats, size_t beatType)

        #! add tempo mark to end of score: default tempo is 100bps
        bool addTempoMark(double tempo)

        #! add dynamics mark (sudden changes) to end of score
        bool addSuddenDynamicsMark(SuddenDynamicsType suddenDynamicsType)

        #! add dynamics mark (gradual changes) to end of score
        bool addGradualDynamicsMark(GradualDynamicsType gradualDynamicsType)

        #! add note to end of score
        bool addNote(size_t duration, const  string& lyric, size_t pitch, bool accent, bool staccato, TieType tieType,
                     SlurType slurType, SyllabicType syllabicType, bool breath = false)

        #! add rest to end of score
        bool addRest(size_t duration)

    cdef cppclass SynthCondition:
        #! constructor
        SynthCondition()

        #! set play flag
        void setPlayFlag()

        #! unset play flag
        void unsetPlayFlag()

        #! set file path to save RIFF format file
        void setSaveFilePath(const string& filePath)

        #! unset file path to save RIFF format file
        void unsetSaveFilePath()

        #! set waveform buffer
        void setWaveformBuffer(vector[double]& waveform)

        #! unset waveform buffer
        void unsetWaveformBuffer()

    cdef cppclass Sinsy:
        #! constructor
        Sinsy()

        #! set languages
        bool setLanguages(const string& languages, const string& configs)

        #! load voice files
        bool loadVoices(const vector[string]& voices)

        #! set encoding
        bool setEncoding(const string& encoding)

        #! add key mark
        bool addKeyMark(ModeType modeType, int fifths)

        #! add beat mark (beats/beattype) to end of score: default beat mark is 4/4
        bool addBeatMark(size_t beats, size_t beattype)

        #! add tempo mark to end of score: default tempo is 100bps
        bool addTempoMark(double tempo)

        #! add dynamics mark (sudden changes) to end of score
        bool addSuddenDynamicsMark(SuddenDynamicsType suddenDynamicsType)

        #! add dynamics mark (gradual changes) to end of score
        bool addGradualDynamicsMark(GradualDynamicsType gradualDynamicsType)

        #! add note to end of score
        bool addNote(size_t duration, const string& lyric, size_t pitch, bool accent, bool staccato, TieType tieType,
                     SlurType slurType, SyllabicType syllabicType, bool breath = false)

        #! add rest to end of score
        bool addRest(size_t duration)

        #! set score to given IScore object
        bool toScore(IScore &) const

        #! set alpha for synthesis
        bool setAlpha(double alpha)

        #! set volume for synthesis
        bool setVolume(double volume)

        #! set interpolation weight for synthesis
        bool setInterpolationWeight(size_t index, double weight)

        #! synthesize
        bool synthesize(SynthCondition& consition)

        #! stop synthesizing
        bool stop()

        #! reset stop flag
        bool resetStopFlag()

        #! clear score
        bool clearScore()

        #! load score from MusicXML
        bool loadScoreFromMusicXML(const string& xml)

        #! save score to MusicXML
        bool saveScoreToMusicXML(const string& xml)

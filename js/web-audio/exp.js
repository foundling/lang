const {
  reactive,
  Div,
  Input,
  Label,
  Button,
  Span,
} = alkali


// web audio
const ctx = new window.AudioContext()
const osc = ctx.createOscillator()
const gain = ctx.createGain()

const scaleVolume = v => v/200
const updateLevel = el => event => {
  el.value = scaleVolume(parseFloat(event.srcElement.value))
}

const updatePitch = el => event => {
  el.frequency.value = Math.pow(2, parseInt(event.srcElement.value)) * baseFreq
}

const baseFreq = Math.pow(2, parseInt(pitch.value)) * 27.5
const gainVal = 0.2
let prevVolume = gainVal 


osc.type = 'square'
osc.frequency.value = baseFreq

gain.gain.value = scaleVolume(vol.value)

osc.connect(gain)
gain.connect(ctx.destination)



// dom
const debugText = reactive('')
const app = new Div([
    Div([
      Span({
        textContent: debugText
      })
    ]),
    Label([
      Input('.volume', {
        onInput: updateLevel(gain.gain), 
        name: 'volume',
        type: 'range',
        min: 0,
        max: 100
      })
    ]),
    Label([
      Input('.pitch', {
        name: 'pitch',
        type: 'range',
        min: 0,
        max: 4
      })
    ]),
    Label([
      Button('.toggle-volume', {
        textContent: 'Toggle Volume ON/OFF',
      })
    ])

])

document.body.appendChild(app)

vol.addEventListener('input', updateLevel(gain.gain))
pitch.addEventListener('input', updatePitch(osc))
volToggleBtn.addEventListener('click', e => {
  gain.gain.value = gain.gain.value == 0 ? prevVolume : 0 
  console.log(gain.gain.value)
}) 

osc.start()

//display constants
const daysInWeek = 7
const weeksInMonth = 5
const studyStart = '2018-01-01'
const studyEnd = new Date() // today
const days = dateFns.eachDay(studyStart, studyEnd) 
const weeks = Math.floor(days.length / daysInWeek)
const DAY_HEIGHT = DAY_WIDTH = 10
const MONTH_HEIGHT = DAY_HEIGHT
const MONTH_WIDTH = DAY_WIDTH * weeksInMonth
const dateMargin = 2
const monthPadding = 10
const colors = ['green','orange','red']
const getMonthKey = d => `${d.date.getMonth()}-${d.date.getFullYear()}`
const subjectComplianceByMonth = d3.nest()
  .key(getMonthKey)
  .entries(
    days.map(date => {
      const status = Math.floor((Math.random()*100) % 3)
      const color = colors[status]
      return { status, color, date } 
    })
  )


const modal = document.createElement('div')
modal.style.display = 'none'
modal.style.position = 'absolute'

document.body.appendChild(modal)

const showModal = ({ text, root }) => {
  modal.style.display = 'block'
  modal.classList.add('modal')
  modal.style.padding = '20px'
  modal.innerHTML = text
  console.log(root)
  positionModal(root)
}

const positionModal = svgElement => {
  modal.style.bottom = svgElement.y.baseVal.valueAsString
  modal.style.left = svgElement.x.baseVal.valueAsString
}
const svg = d3.select('body').append('svg')
  .attr('height', '100px')
  .attr('width', '100%')
  .attr('fill', 'red')

const months = svg
  .selectAll('g')
  .data(subjectComplianceByMonth)
  .enter()
  .append('g')
  .attr('class','month')
  .attr('transform',(d,i) => `translate(${i * (MONTH_WIDTH + dateMargin)},0)`)

const daysPerMonth = months
  .selectAll('g')
  .data((d,i) => d.values)
  .enter()
  .append('rect')
  .attr('height', DAY_WIDTH)
  .attr('width', DAY_HEIGHT)
  .attr('x',(d,i) => Math.floor(i/daysInWeek)*DAY_HEIGHT)
  .attr('y',(d,i) => (i % daysInWeek)*DAY_WIDTH)
  .attr('fill',d => d.color)
  .on('mouseenter', function(d,i,elements) {
      const root = this
      console.log(root)
    showModal({ text: d.color, root })
  })
  .append('svg:title')
  .text((d,i) => dateFns.format(d.date,'MM-DD-YYYY'))

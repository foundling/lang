const finalExamGrades = [
  '89',
  '42',
  '85',
  '53',
  '86',
  '91',
  '93',
  '98',
]

const svgWidth = 600
const svgHeight = 200
const barWidth = svgWidth / finalExamGrades.length
const barPadding = 5
const svg = d3.select('svg')
  .attr('width', svgWidth)
  .attr('height', svgHeight)
  .attr('fill', 'black')

const yScale = d3.scaleLinear()
  .domain([0, d3.max(finalExamGrades)])
  .range([0, svgHeight])

const barChart = svg.selectAll('rect')
  .data(finalExamGrades)
  .enter()
  .append('rect')
  .style('fill', 'rgb(60,60,60)')
  .attr('y', data => svgHeight - yScale(data))
  .attr('height', data => yScale(data))
  .attr('width', barWidth - barPadding) 
  .attr('transform', (data, i) => `translate(${[barWidth * i + barPadding/2, 0]})`)

const labels = svg.selectAll('text')
  .data(finalExamGrades)
  .enter()
  .append('text')
  .attr('text-anchor', 'middle')
  .text(score => score)
  .attr('y', (d,i) => svgHeight - d - 2)
  .attr('x', (d,i) => (barWidth * i) + (barWidth/2))
  .attr('fill', 'white')


//dateFns
//d3
//_

const today = new Date()
const syncWindowInDays = 3
const startDate = dateFns.parse('2018-12-01')
const endDate = dateFns.parse('2019-04-01')
const withinSyncWindow = (today, syncDate, syncWindowDays) => dateFns.differenceInDays(today, syncDate) <= syncWindowDays // 
const { SYNCED, NOT_SYNCED, PENDING, OUT_OF_RANGE } = { 
  SYNCED: 'SYNCED', 
  NOT_SYNCED: 'NOT_SYNCED', 
  PENDING: 'PENDING', 
  OUT_OF_RANGE: 'OUT_OF_RANGE' 
}
const subjectStartDates = {
  '1001': new Date('2018-12-01'),
  '1002': new Date('2018-12-01'),
  '1003': new Date('2018-12-01'),
  '1004': new Date('2018-12-01'),
  '1005': new Date('2018-12-01'),
  '1006': new Date('2018-12-01'),
}
const filenames = [

  '1001_2018-12-01',
  '1001_2018-12-02',
  '1001_2018-12-03',
  '1001_2018-12-04',
  '1001_2018-12-05',
  '1001_2018-12-06',
  '1001_2018-12-07',

  '1002_2018-12-01',
  '1002_2018-12-02',
  '1002_2018-12-05',
  '1002_2018-12-06',
  '1002_2018-12-08',
  '1002_2018-12-09',
  '1002_2018-12-10',

  '1003_2018-12-02',
  '1003_2018-12-03',
  '1003_2018-12-04',
  '1003_2018-12-05',
  '1003_2018-12-06',
  '1003_2018-12-07',
  '1003_2018-12-08',
  '1003_2018-12-10',

  '1004_2018-12-01',
  '1004_2018-12-02',
  '1004_2018-12-05',
  '1004_2018-12-06',
  '1004_2018-12-07',
  '1004_2018-12-08',
  '1004_2018-12-09',
  '1004_2018-12-10',
  '1004_2018-12-11',
  '1004_2018-12-12',

  '1005_2018-12-01',
  '1005_2018-12-02',
  '1005_2018-12-03',
  '1005_2018-12-04',
  '1005_2018-12-05',
  '1005_2018-12-06',
  '1005_2018-12-07',
  '1005_2018-12-08',
  '1005_2018-12-10',
  '1005_2018-12-11',
  '1005_2018-12-12',
  '1005_2018-12-14',

  '1006_2018-12-03',
  '1006_2018-12-04',
  '1006_2018-12-05',
  '1006_2018-12-06',
  '1006_2018-12-07',
  '1006_2018-12-09',
  '1006_2018-12-10',
  '1006_2018-12-12',
  '1006_2018-12-11',
  '1006_2018-12-13'

]

const subjectSyncStatus = filenames.reduce((o, fname) => {

    const [ subjectId, syncDate ] = fname.split('_')

    o[subjectId] = o[subjectId] || {}
    o[subjectId][syncDate] = true

    return o

}, {})

const getSyncStatus = (today, syncDate, syncWindowDays, subjectStartDate) => {

  if (!syncDate) {

    if (withinSyncWindow(today, syncDate, syncWindowDays))
      return PENDING

    else
      return NOT_SYNCED

  } else {

    if (dateFns.isBefore(syncDate, subjectStartDate))
      return OUT_OF_RANGE

    else
      return SYNCED

  }

}

const dataset = Object.keys(subjectStartDates)
  .map(subjectId => {
    return dateFns.eachDay(startDate, endDate).map(dateToCheck => {
      const hasData = subjectSyncStatus[subjectId][dateFns.format(dateToCheck, 'YYYY-MM-DD')]
      const subjectSyncDate = hasData ? dateToCheck : null
      return ({
        subjectId,
        syncDate: dateToCheck, 
        syncStatus: getSyncStatus(
          today, 
          subjectSyncDate,
          syncWindowInDays,
          subjectStartDates[subjectId]
        )
      })
    })
  }).flat()

function pathMonth(t) {
  const n = weekday === "weekday" ? 5 : 7;
  const d = Math.max(0, Math.min(n, countDay(t)));
  const w = timeWeek.count(d3.utcYear(t), t);
  return `${d === 0 ? `M${w * cellSize},0`
      : d === n ? `M${(w + 1) * cellSize},0`
      : `M${(w + 1) * cellSize},0V${d * cellSize}H${w * cellSize}`}V${n * cellSize}`;
}
const format = d3.format("+.2%")
const syncStatusColor = syncStatus => syncStatus === 'SYNCED'       ? 'lightblue' :
                                      syncStatus === 'NOT_SYNCED'   ? 'red'       :
                                      syncStatus === 'PENDING'      ? 'orange'    :
                                      syncStatus === 'OUT_OF_RANGE' ? 'lightgray' : 
                                                                      'transparent'

const weekday = 'sunday'
const timeWeek = d3.utcSunday
const countDay = d => d.getUTCDay()
const formatDay = d => "SMTWTFS"[d.getUTCDay()]
const formatDate = d3.utcFormat("%x")
const formatMonth = d3.utcFormat("%b")
const height = 149
const cellSize = 17
const years = d3.nest()
  .key(d => d.syncDate.getUTCFullYear())
  //.key(d => d.subjectId)
  //.key(d => d.syncDate.getUTCMonth())
  .entries(dataset)

const svg = d3.select('svg')
const year = svg.selectAll('g')
  .data(years)
  .join('g')
    .attr('transform', (data, i) => `translate(40,${height * i + cellSize * 1.5})`)

year.append("text")
  .attr("x", -5)
  .attr("y", -5)
  .attr("font-weight", "bold")
  .attr("text-anchor", "end")
  .text(d => d.key)

year.append("g")
    .attr("text-anchor", "end")
  .selectAll("text")
  .data( d3.range(7).map(i => new Date(1995, 0, i)) )
  .join("text")
    .attr("x", -5)
    .attr("y", d => ((d.getUTCDay() + 0.5) * cellSize))
    .attr("dy", "0.31em")
    .text(formatDay)

year.append("g")
	.selectAll("rect")
	.data(d => d.values)
	.join("rect")
		.attr("width", cellSize - 1)
		.attr("height", cellSize - 1)
		.attr("x", d => timeWeek.count(d3.utcYear(d.syncDate), d.syncDate) * cellSize + 0.5)
		.attr("y", d => countDay(d.syncDate) * cellSize + 0.5)
		.attr("fill", d => syncStatusColor(d.syncStatus))
	.append("title")
		.text(d => `${formatDate(d.syncDate)}: ${d.syncStatus}`);

const month = year.append('g')
  .selectAll('g')
  .data(d => d3.utcMonths(d3.utcMonth(d.values[0].syncDate), d.values[d.values.length - 1].syncDate))
  .join('g')

month.filter((d, i) => console.log(i) || i).append("path")
  .attr("fill", "none")
  .attr("stroke", "#fff")
  .attr("stroke-width", 3)
  .attr("d", pathMonth);

month.append('text')
  .attr('x', d => timeWeek.count(d3.utcYear(d), timeWeek.ceil(d)) * cellSize + 2)
  .attr('y', -5)
  .text(formatMonth)

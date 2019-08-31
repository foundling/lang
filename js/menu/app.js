const { UL, LI } = alkali
const container = document.body

const menu = new UL('.menu', [
    LI('.item', [
      'Level 1',
      UL('.menu', [
        LI('.item', [
          'Level 2',
        ])
      ])
    ]),
    LI('.item', [
      'Level 1',
      UL('.menu', [
        LI('.item', [
          'Level 2',
        ])
      ])
    ]),
])

container.appendChild(menu)

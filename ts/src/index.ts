interface City {
  type: 'ZipCode'
}

interface ZipCode {
  type: 'ZipCode'
}

type Location = City | ZipCode

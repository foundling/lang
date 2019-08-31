import {
  LI,
  Span,
  UL
} from 'alkali'

export default RiskOfBiasRating extends UL {
  ready(props) {

    const ratings = [
      'Yes (Low Risk)',
      'No (High Risk)',
      'Unclear'
    ]
    const icons = [
      'fa-plus-circle',
      'fa-minus-circle',
      'fa-ban'
    ]
    const classes = [
      'yes',
      'no',
      'unclear'
    ]

    this.append(
      _.zip[ratings, icons, classes]
      .map(([rating,icon, className]) => LI(`.rob-rating-${className}`, [ 
          I('.fa-circle'), 
          rating 
        ])),
    )

  }
}

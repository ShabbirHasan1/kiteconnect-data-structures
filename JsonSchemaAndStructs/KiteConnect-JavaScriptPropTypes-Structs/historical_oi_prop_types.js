// Example usage:
//
// import { MyShape } from ./myShape.js;
//
// class MyComponent extends React.Component {
//   //
// }
//
// MyComponent.propTypes = {
//   input: MyShape
// };

import PropTypes from "prop-types";

let _HistoricalOi;
let _Data;
_Data = PropTypes.shape({
    "candles": PropTypes.oneOfType([PropTypes.arrayOf(PropTypes.arrayOf(PropTypes.oneOfType([PropTypes.number, PropTypes.string]))), PropTypes.any]),
});
_HistoricalOi = PropTypes.shape({
    "data": PropTypes.oneOfType([_Data, PropTypes.any]),
    "status": PropTypes.oneOfType([PropTypes.any, PropTypes.string]),
});

export const HistoricalOi = _HistoricalOi;

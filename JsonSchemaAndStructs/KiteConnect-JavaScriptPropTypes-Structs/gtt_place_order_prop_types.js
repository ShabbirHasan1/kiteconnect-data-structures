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

let _GttPlaceOrder;
let _Data;
_Data = PropTypes.shape({
    "trigger_id": PropTypes.oneOfType([PropTypes.number, PropTypes.any]),
});
_GttPlaceOrder = PropTypes.shape({
    "data": PropTypes.oneOfType([_Data, PropTypes.any]),
    "status": PropTypes.oneOfType([PropTypes.any, PropTypes.string]),
});

export const GttPlaceOrder = _GttPlaceOrder;

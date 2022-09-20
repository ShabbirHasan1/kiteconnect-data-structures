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

let _SessionLogout;
_SessionLogout = PropTypes.shape({
    "data": PropTypes.oneOfType([PropTypes.bool, PropTypes.any]),
    "status": PropTypes.oneOfType([PropTypes.any, PropTypes.string]),
});

export const SessionLogout = _SessionLogout;

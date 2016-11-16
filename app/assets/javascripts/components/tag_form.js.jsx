let TagForm = React.createClass({
  getInitialState() {
    tags: @props.tags;
  },

  getDefaultProps() {
    tags: [];
  },

  render() {
    return (
      <div>
        <input list="tags">
        <datalist id="tags">

          <option value="Internet Explorer">
        </datalist>
        <input type="submit">
      </div>
    )
  }
});
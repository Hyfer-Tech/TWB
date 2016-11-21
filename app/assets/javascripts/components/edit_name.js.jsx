let EditName = React.createClass({
  getInitialState() {
    return { name: this.props.name };  
  },

  render() {
    return (
      <div className="text-center">
        <h3>{this.state.name}</h3>
      </div>
    )
  }
});
let Main = React.createClass({
  getInitialState() {
    return {
      description: this.props.description
    }
  },

  render() {
    return (
      <UserInfo description={this.state.description}/>
    )
  }
});

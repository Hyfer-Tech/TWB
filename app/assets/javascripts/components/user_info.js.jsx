let UserInfo = React.createClass({
  render() {
    return (
      <div>
        <div className="col-xs-12">
          <h3>Description</h3>
        </div>
        <div className="col-xs-12">
          {this.props.description}
        </div>
      </div>
    )
  }
});

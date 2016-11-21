let EditName = React.createClass({
  getInitialState() {
    return { editable: false };  
  },

  handleEdit() {
    console.log("clicked!");
    this.setState({editable: !this.state.editable});  
  },

  render() {
    var first_name = this.state.editable ? 
                <input type='text' defaultValue={this.props.name.first_name} /> : 
                <span onClick={this.handleEdit}>{this.props.name.first_name}</span>;

    var last_name = this.state.editable ?
                <div> 
                  <input type='text' defaultValue={this.props.name.last_name} /> 
                  <button>Update</button>
                </div>: 
                <span onClick={this.handleEdit}>{this.props.name.last_name}</span>;
    return (
      <div className="text-center">
        <h3>{first_name} {last_name}</h3>
      </div>
    )
  }
});
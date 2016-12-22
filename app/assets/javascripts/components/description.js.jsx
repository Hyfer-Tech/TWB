let Description = React.createClass({
  getInitialState() {
    return {
      editable: false
    }
  },

  description() {
    if(this.state.editable) {
      return (
        <input type="text" defaultValue={this.props.description} className='form-control'/>
      )
    } else {
      return (
        <span onClick={this.handleClick} >{this.props.description}</span>
      )
    }
  },

  handleClick() {
    this.setState({editable: !this.state.editable});
  },

  handleCancel() {
    this.setState({editable:false});
  },

  updateButton() {
    if(this.state.editable) {
      return (
        <button onClick={this.handleEdit} className="btn btn-sm btn-success">Update</button>
      )
    }
  },

  cancelButton() {
    if(this.state.editable) {
      return (
        <button onClick={this.handleCancel} className="btn btn-sm btn-danger">Cancel</button>
      )
    }
  },

  btnGroup(){
    if (this.state.editable) {
      return (
        <div className="btn-group pull-right" style={{"margin-bottom": "25px"}}>
          <br />
          { this.updateButton() }
          { this.cancelButton() }
          <br />
        </div>
      )
    }
  },

  render() {
    return (
      <div>
        <div className="col-xs-12">
          <h3>Description</h3>
        </div>
        <div className="col-xs-12">
          <div className="col-xs-12">
            {this.description()}
          </div>
          <div className="col-xs-12">
            {this.btnGroup()}
          </div>
        </div>
      </div>
    )
  }
})

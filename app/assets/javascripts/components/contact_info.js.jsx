let ContactInfo = React.createClass({
  getInitialState() {
    return {
      editable: false
    }
  },

  handleClick() {
    this.setState({editable: !this.state.editable});
  },

  email() {
    if(this.state.editable) {
      return (
        <input type="text" defaultValue={this.props.email} className='form-control'/>
      )
    } else {
      return (
        <h4 onClick={this.handleClick} >{this.props.email}</h4>
      )
    }
  },

  phoneNumber() {
    if(this.state.editable) {
      return (
        <input type="text" defaultValue={this.props.phone} className='form-control'/>
      )
    } else {
      return (
        <h4 onClick={this.handleClick} >{this.props.phone}</h4>
      )
    }
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
          <br/>
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
          <h3>Contact Info</h3>
        </div>
        <div className="col-xs-12">
          <div className="col-xs-3">
            <h4>Email</h4>
          </div>
          <div className="col-xs-9">
            {this.email()}
          </div>
        </div>
        <div className="col-xs-12">
          <div className="col-xs-3">
            <h4>Phone No</h4>
          </div>
          <div className="col-xs-9">
            {this.phoneNumber()}
          </div>
        </div>
        <div className="col-xs-12">
          {this.btnGroup()}
        </div>
      </div>
    )
  }
})

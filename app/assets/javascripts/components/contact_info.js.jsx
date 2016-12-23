let ContactInfo = React.createClass({
  getInitialState() {
    return {
      editable: false,
      email: this.props.email,
      phone: this.props.phone
    }
  },

  handleClick() {
    if(this.state.editable) {
      let email = this.refs.email.value;
      let phone =  this.refs.phone.value;
      let updated_user_info = { email, phone }
      this.props.handleUpdate(updated_user_info);
      this.setState({email, phone});
    }
    this.setState({editable: !this.state.editable});
  },

  email() {
    if(this.state.editable) {
      return (
        <input ref="email" type="text" defaultValue={this.state.email} className='form-control'/>
      )
    } else {
      return (
        <h4 onClick={this.handleClick} >{this.state.email}</h4>
      )
    }
  },

  phoneNumber() {
    if(this.state.editable) {
      return (
        <input ref="phone" type="text" defaultValue={this.state.phone} className='form-control'/>
      )
    } else {
      return (
        <h4 onClick={this.handleClick} >{this.state.phone}</h4>
      )
    }
  },

  handleCancel() {
    this.setState({editable:false});
  },

  updateButton() {
    if(this.state.editable) {
      return (
        <button onClick={this.handleClick} className="btn btn-sm btn-success">Update</button>
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

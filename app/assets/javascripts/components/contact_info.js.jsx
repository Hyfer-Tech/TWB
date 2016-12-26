let ContactInfo = React.createClass({
  getInitialState() {
    return {
      editable: false,
      email: this.props.email,
      phone: this.props.phone,
    }
  },

  onChange(e) {
    let name = e.target.name;
    this.setState({ [name]: e.target.value });
  },

  handleClick() {
    if(this.state.editable) {
      let updated_user_info = { email: this.state.email, phone: this.state.phone }
      this.props.handleUpdate(updated_user_info);
      this.props.updateMain(updated_user_info);
    }
    this.setState({editable: !this.state.editable});
  },

  valid() {
    return this.state.email && this.state.phone;
  },

  email() {
    if(this.state.editable) {
      return (
        <input name="email" onChange={this.onChange} type="text" defaultValue={this.state.email} className='form-control'/>
      )
    } else {
      return (
        <h4 onClick={this.handleClick} className="email-text" >
          {this.state.email}
          <i className="fa fa-pencil" id="edit-pencil" aria-hidden="true"></i>
        </h4>
      )
    }
  },

  phoneNumber() {
    if(this.state.editable) {
      return (
        <input name="phone" type="text" onChange={this.onChange} defaultValue={this.state.phone} className='form-control'/>
      )
    } else {
      return (
        <h4 onClick={this.handleClick} className="phone-text">
          {this.state.phone}
          <i className="fa fa-pencil" id="edit-pencil" aria-hidden="true"></i>
        </h4>
      )
    }
  },

  handleCancel() {
    this.setState({editable:false, phone: this.props.phone, email: this.state.email});
  },

  updateButton() {
    if(this.state.editable) {
      return (
        <button onClick={this.handleClick} className="btn btn-sm btn-success" disabled={!this.valid()}>Update</button>
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
